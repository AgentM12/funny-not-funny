"""
This script/module is able to convert between NBT and jNBT and json with relative ease.

jNBT is the format that the NBT().data holds. It can be serialized to json and NBT.
See the spec jNBT_specification.md for more info!

Version: 1.0
by Melvin S.

"""

import gzip
import struct
import json

import modified_utf8


############################# CONSTANTS #############################
# Yes I know it's ugly down below, but it works. So, Deal With it!  #

TAG_End = b'\x00' # 0
TAG_Byte = b'\x01' # 1
TAG_Short = b'\x02' # 2
TAG_Int = b'\x03' # 3
TAG_Long = b'\x04' # 4
TAG_Float =b'\x05' # 5
TAG_Double = b'\x06' # 6
TAG_Byte_Array = b'\x07' # 7
TAG_String = b'\x08' # 8
TAG_List = b'\x09' # 9
TAG_Compound = b'\x0a' # 10
TAG_Int_Array = b'\x0b' # 11
TAG_Long_Array = b'\x0c' # 12

# What value should be used if None is encountered.
# ex: ["I", 0], [], {}, "None", "null", "ERROR", ["B", 0], ...
# Set to None to delete the entire key-value entry.
LOSSY_NONE_POLICY = None #"null"

ARRAY_TYPES = ("BA", "IA", "LA")
PRIM_TYPES = ("B", "S", "I", "L", "F", "D")

TYPE_INFO = [
	{"tag": TAG_Byte,       "spf": "b",  "size": 1,    "SST": "B"},
	{"tag": TAG_Short,      "spf": "h",  "size": 2,    "SST": "S"},
	{"tag": TAG_Int,        "spf": "i",  "size": 4,    "SST": "I"},
	{"tag": TAG_Long,       "spf": "q",  "size": 8,    "SST": "L"},
	{"tag": TAG_Float,      "spf": "f",  "size": 4,    "SST": "F"},
	{"tag": TAG_Double,     "spf": "d",  "size": 8,    "SST": "D"},
	{"tag": TAG_String,                                "SST": "s"},
	{"tag": TAG_Compound,                              "SST": "c"},
	{"tag": TAG_List,                                  "SST": "l"},
	{"tag": TAG_End,                     "size": 0,    "SST": "e"},
	{"tag": TAG_Byte_Array, "spf": "b",  "size": 1,    "SST": "BA", "single": "B"},
	{"tag": TAG_Int_Array,  "spf": "i",  "size": 4,    "SST": "IA", "single": "I"},
	{"tag": TAG_Long_Array, "spf": "q",  "size": 8,    "SST": "LA", "single": "L"},
	{                       "spf": "H",  "size": 2,    "SST": "US"}
]

def get_info(key_known, value_known, key_retrieve=None):
	for t in TYPE_INFO:
		if key_known in t and t[key_known] == value_known:
			if key_retrieve is None:
				return t
			return t[key_retrieve]
	return None

def get_info_tag(known_sst): return get_info("SST", known_sst, "tag")
def get_info_sst(known_tag): return get_info("tag", known_tag, "SST")

########################## NBT CLASS SPEC ##########################
class NBT:
	"""An NBT object as defined for Minecraft."""

	def __init__(self, name=None):
		self.name = name if name is not None else ""
		self.data = {}

	def __getitem__(self, key): return self.get(key)
	def __delitem__(self, key): self.remove(key)

	def __str__(self): return str(self.data)
	def __repr__(self): return repr(self.data)

	def snbt(self, force_quote_names=False, sep=(": ", ", ", "; "), braces=('{', '}')):
		return _show(self.data, force_quote_names, sep, braces)

	def merge(self, tag, parent=None):
		'''
		Similar to minecraft data merge, adds or replaces existing with new kv pair (tag) under parent.
		Tags should be retrieved using the respective methods to guarantee validity.
		Parent is obtained through nbt[indexing][like][this].
		'''
		if parent is None: parent = self.data
		parent[tag[0]] = tag[1]

	def insert(self, value, index, parent, auto_promote=False):
		if value is None: raise ValueError("Value may not be None!")
		_change_list_if_compatible(parent, value, index, auto_promote)

	def append(self, value, parent, auto_promote=False):
		if value is None: raise ValueError("Value may not be None!")
		_change_list_if_compatible(parent, value, None, auto_promote)

	def prepend(self, value, parent, auto_promote=False): self.insert(value, 0, parent, auto_promote)
	def get(self, key): return safe_get(self.data, key)

	def remove(self, key_or_index, parent=None):
		if parent is None: parent = self.data
		if isinstance(key_or_index, str) and key_or_index in parent: del parent[key_or_index]
		elif isinstance(key_or_index, int): _change_list_if_compatible(parent, None, key_or_index)

	def serialize(self):
		data_bytes = header(get_info_tag("c"), self.name)
		for key in self.data.keys(): data_bytes += _serialize(self.data[key], key)
		data_bytes += TAG_End
		return data_bytes

	def dump(self, file, uncompressed=False, ext=".nbt"):
		data = self.serialize()
		with open(''.join([file, ext]), 'wb') as fp:
			if uncompressed: fp.write(data)
			else:
				with gzip.GzipFile(filename=file, fileobj=fp) as gp: gp.write(data)

	def dump_as_jnbt(self, file, ext=".nbt.json", sort_keys=False, indent=None, separators=None):
		'''
		JSON That preserves all type information.
		ext is conveniently set to .nbt.json so its top-level extension is easily recognized.
		Alternatively use .jnbt, a .jnbt file follow .json spec no matter what.
		'''
		with open(''.join([file, ext]), 'w+') as f:
			json.dump(self.data, f, sort_keys=sort_keys, indent=indent, separators=separators)

	def dump_as_snbt(self, file, ext=".snbt", fqn=False, sep=(": ", ", ", "; "), braces=('{', '}')):
		'''
		Dumps in SNBT Format.
		'''
		snbt_data = self.snbt(fqn, sep, braces)
		with open(''.join([file, ext]), 'w+') as f:
			f.write(snbt_data)

	def dump_as_json(self, file, ext=".json", sort_keys=False, indent=None, separators=None):
		'''
		Lossy JSON, all types are dropped as well as the name.
		'''
		json_data = {}
		_convert_to_raw_json(self.data, json_data)
		with open(''.join([file, ext]), 'w+') as f:
			json.dump(json_data, f, sort_keys=sort_keys, indent=indent, separators=separators)

	def as_dict(self):
		'''
		Lossy Dict, all types are dropped as well as the name.
		'''
		d = {}
		_convert_to_raw_json(self.data, d)
		return d


############################ EASY TYPES ############################

def tag_compound(name, value):
	if not validate_nbt(value):
		raise ValueError("The value is not valid jNBT")
	return (name, value)

def tag_list(name, value):
	if not validate_nbt({"validation": value}):
		raise ValueError("The value is not valid jNBT")
	return (name, value)

def tag_byte_array(name, value): return (name, _tag_xxx_array("BA", value))
def tag_int_array(name, value): return (name, _tag_xxx_array("IA", value))
def tag_long_array(name, value): return (name, _tag_xxx_array("LA", value))

def _tag_xxx_array(t, value):
	lim = 1 << (8 * get_info("SST", t, "size") - 1)
	lim_min = -lim
	lim_max = lim - 1
	clean = [t]
	for v in value:
		if isinstance(v, bool): v = 1 if v else 0
		if not isinstance(v, int) or v < lim_min or v > lim_max:
			raise ValueError(f"The value {v} is not within the limits {lim_min}-{lim_max}!")
		clean.append(v)
	return clean

def tag_string(name, value): return (name, value)
def tag_byte(name, value): return _tag_prim("B", name, value)
def tag_short(name, value): return _tag_prim("S", name, value)
def tag_int(name, value): return _tag_prim("I", name, value)
def tag_long(name, value): return _tag_prim("L", name, value)
def tag_float(name, value):
	value = struct.unpack(">f", struct.pack(">f", value))[0] # Ensure the float fits neatly into a float even if it is at the price of precision.
	return _tag_prim("F", name, value)
def tag_double(name, value): return _tag_prim("D", name, value)

def _tag_prim(flag, name, value):
	if isinstance(value, bool): value = 1 if value else 0 # Global conversion of T/F to 1/0
	v_flag = _promote(_get_smallest_fit_type(value, True), flag)
	if v_flag == flag:
		return (name, [flag, value])
	raise ValueError(f"The value {value} ({v_flag}) does not fit in the datatype {flag}")


######################## STATIC CLASS FUNCS ########################

def validate_nbt(possibly_nbt_data):
	nbt = NBT()
	nbt.data = possibly_nbt_data
	try:
		nbt.serialize() # Acts as a validation of the data.
	except:
		return False
	return True

def load_jnbt(name, file):
	'''
	Loads jNBT files. (files dumped from NBT using json)
	'''
	nbt = NBT()
	with open(file, 'r') as f:
		data = json.load(f)
	return nbt_from_raw_data(name, data)

def nbt_from_json(name, json_data):
	'''
	Valid json (loaded through json module) can be roughly converted to NBT (types are guessed as best as possible)
	Can not be reliably used for Minecraft, except for custom NBT usage that doesn't use strict data types.
	This will use ints and doubles when in doubt and therefore generate much larger NBT in general.
	'''
	nbt = NBT(name)
	if not isinstance(json_data, dict):
		json_data = {"": json_data}
	for key in json_data:
		_lossy_conversion(json_data, nbt.data, key)
	return nbt

def nbt_from_raw_data(name, data):
	nbt = NBT(name)
	nbt.data = data
	try:
		nbt.serialize() # Acts as a validation of the data.
	except:
		raise ValueError("The format of the data is invalid/non-serializable!")
	return nbt

def load_nbt(file):
	with open(file, 'rb') as fp:
		byte1 = fp.read(1)
		byte2 = fp.read(1)
		is_compressed = (byte1 == b'\x1f') and (byte2 == b'\x8b')
		if not is_compressed:
			fp.seek(0)
			return _deserialize_nbt(fp)
	with gzip.open(file, 'rb') as fp:
		return _deserialize_nbt(fp)

################################# PRIVATE #################################

def _change_list_if_compatible(parent, value, index=None, auto_promote=False):
	'''
	Tries to add value to index or append if None.
	If value is None, tries to delete a value at the index must be a valid value.
	'''
	if not isinstance(parent, list): # TYPE_CHECK
		raise ValueError(f"Parent {parent} is not a list!")

	if value is None: # DELETE
		if index is None: raise ValueError("Can't delete value at None index.")
		
		lb = -len(parent)
		hb = max(0, len(parent) - 1)
		if index < 0 and index > lb: del parent[index]
		elif index < hb: del parent[index + 1]
		else: raise ValueError(f"Index {index} out of (exclusive) bounds {lb}-{hb}")
		
		if len(parent) == 1 and not (parent[0] in ARRAY_TYPES): # No need to store type info at this point unless it's an array.
			del parent[0]

	if len(parent) > 0: # GET_PARENT_TYPE
		p0 = parent[0]
		if p0 in ARRAY_TYPES:
			list_type = get_info("SST", p0, "single")
		elif p0 in PRIM_TYPES:
			raise ValueError(f"Parent {parent} is a primitive!")
		elif isinstance(p0, list):
			if len(parent) > 1:
				list_type = p0[0]
			else:
				list_type = "e"
				parent.clear()
	else:
		list_type = "e"

	if isinstance(value, bool):
		val_type = "B"
		val_val = 1 if value else 0
	elif isinstance(value, str):
		val_type = "s"
		val_val = value
	elif isinstance(value, dict):
		val_type = "c"
		val_val = value
	elif isinstance(value, (int, float)):
		val_type = _promote(list_type, _get_smallest_fit_type(value, True)) # Raw types are promoted anyways.
		val_val = value
	elif isinstance(value, list):
		if len(value) > 0: # GET_VALUE_TYPE
			p0 = value[0]
			if p0 in ARRAY_TYPES:
				val_type = p0
				if len(value) > 1: val_val = value[1:]
				else: val_val = []
			elif p0 in PRIM_TYPES:
				val_type = p0
				val_val = value[1]
			elif isinstance(p0, list):
				val_type = "l"
				if len(value) > 1: val_val = value
				else: val_val = []
		else:
			val_type = "e"

	def _insert(parent, index, value):
		lb = -len(parent)
		hb = max(0, len(parent) - 1)
		if index < 0 and index >= lb: parent.insert(index, value)
		elif index <= hb: parent.insert(index+1, value)
		else: raise ValueError(f"Index {index} out of bounds {lb}-{hb}")

	if auto_promote and list_type in PRIM_TYPES and val_type in PRIM_TYPES:
		list_type = _promote(list_type, val_type)
		val_type = list_type
		parent[0] = list_type

	if list_type == "e":
		parent.append(val_type)
		if index is None: parent.append(val_val)
		else: _insert(parent, index, val_val)
	elif list_type == val_type:
		if index is None: parent.append(val_val)
		else: _insert(parent, index, val_val)

def _serialize(data, name=None, override_type=None):
	'''
	Serializes named data into raw bytes. Inside lists, name should be called with none.
	For BA, IA and LA, override_type must be set.
	'''
	if isinstance(data, dict):
		data_bytes = header(get_info_tag("c"), name)
		for key in data.keys(): data_bytes += _serialize(data[key], key)
		data_bytes += TAG_End
		return data_bytes
	elif isinstance(data, str):
		return header(get_info_tag("s"), name) + payload_str(data)
	elif isinstance(data, list):
		if override_type in ARRAY_TYPES: d_type = override_type
		elif len(data) < 1: d_type = ["e"] # Empty list
		else:
			d_type = data[0]
			data = data[1:]
		return _serialize_list_candidate(data, d_type, name)
	elif override_type is not None and (isinstance(data, float) or isinstance(data, int)):
		return payload_prim(get_info("SST", override_type, "spf"), data)
	else:
		raise ValueError(f"Unrecognized data ({data}) with type: {type(data)}")

def _serialize_list_candidate(data, d_type, name=None):
	'''
	Either serializes into a list or into primitive type (tagged with type)
	'''
	if isinstance(d_type, list):
		d_type = d_type[0]
		d_len = len(data)

		data_bytes = header(TAG_List, name)
		data_bytes += get_info_tag(d_type) if d_len > 0 else b'\x00'
		data_bytes += payload_prim("i", d_len)
		if d_len > 0:
			for d in data: data_bytes += _serialize(d, None, d_type)
		return data_bytes
	elif d_type in ARRAY_TYPES:
		d_len = len(data)

		data_bytes = header(get_info_tag(d_type), name)
		data_bytes += payload_prim("i", d_len)
		if d_len > 0:
			i_type = get_info("SST", d_type, "single")
			for d in data: data_bytes += _serialize(d, None, i_type)
		return data_bytes
	else: # Not a list, rather a primitive data type.
		return header(get_info_tag(d_type), name) + payload_prim(get_info("SST", d_type, "spf"), data[0])
		
def _deserialize(fp, data, override_type=None):
	while True:
		if override_type is None: v = fp.read(1)
		else: v = override_type
		if v == TAG_String:
			if override_type is None:
				name = read_str(fp)
				data[name] = read_str(fp)
			else:
				data.append(read_str(fp))
		elif v == TAG_Compound:
			if override_type is None:
				name = read_str(fp)
				data[name] = {}
				_deserialize(fp, data[name])
			else:
				data.append({})
				_deserialize(fp, data[-1])
		elif v == TAG_List:
			if override_type is None:
				name = read_str(fp)
				data[name] = []
			else:
				data.append([])
			l_type = fp.read(1)
			l_size = max(0, read_prim(fp, get_info("SST", "I")))
			sst = get_info_sst(l_type)
			if override_type is None:
				data[name].append([sst])
				[_deserialize(fp, data[name], l_type) for i in range(l_size)]
			else:
				data[-1].append([sst])
				[_deserialize(fp, data[-1], l_type) for i in range(l_size)]
		elif v in [TAG_Byte_Array, TAG_Int_Array, TAG_Long_Array]:
			t_info = get_info("tag", v)
			if override_type is None:
				name = read_str(fp)
				data[name] = [t_info["SST"]]
			else:
				data.append([])
			l_size = max(0, read_prim(fp, get_info("SST", "I")))
			if override_type is None:
				data[name].extend([read_prim(fp, t_info) for i in range(l_size)])
			else:
				data[-1].extend([read_prim(fp, t_info) for i in range(l_size)])
		elif v == TAG_End:
			break
		else:
			t_info = get_info("tag", v)
			if override_type is None:
				name = read_str(fp)
				data[name] = [t_info["SST"], read_prim(fp, t_info)]
			else:
				data.append(read_prim(fp, t_info))

		if override_type is not None: return # Iterating outside call.

def _deserialize_nbt(fp):
	v = fp.read(1)
	if v != TAG_Compound: raise ValueError(f"Expected TAG_Compound (0a) but got: {v}")
	nbt_name = read_str(fp)
	data = {}
	_deserialize(fp, data)
	return nbt_from_raw_data(nbt_name, data)

def _lossy_conversion(data, parent, key):
	'''
	Converts data[key] to valid jNBT and stores into parent[key]
	This is a best-as-possible strategy, since jNBT is a specialization of json,
	the json data might not contain enough information to unambiguously convert to jNBT.
	Also, this method should NOT take in a jNBT file, as it would apply the conversion twice.
	Use the regular method to open jNBT files. Either a file is valid jNBT or it is raw json.
	'''
	val = data[key]
	if val is None:
		if LOSSY_NONE_POLICY is not None: parent[key] = LOSSY_NONE_POLICY # don't add anything if None. 
	elif isinstance(val, str):
		parent[key] = val # Don't need to do anything.
	elif isinstance(val, bool):
		parent[key] = ["B", 1 if val else 0]
	elif isinstance(val, int):
		ty = _get_smallest_fit_type(val)
		parent[key] = [ty, val]
	elif isinstance(val, float):
		ty = _get_smallest_fit_type(val)
		parent[key] = [ty, val]
	elif isinstance(val, list):
		parent[key] = []
		_lossy_conversion_list(val, parent[key])
	elif isinstance(val, dict):
		parent[key] = {}
		[_lossy_conversion(val, parent[key], k) for k in val]
	else:
		raise ValueError(f"Encountered non-from-json-value: {val}")

def _promote(old_t, new_t):
	'''
	Returns the least lossiest type while keeping it small.
	D > (F, L, I, S, B)
	F > I, S, B 
	L > I, S, B
	I > S, B
	S > B
	if one is F and the other is L, it is promoted to D as well.
	'''
	if old_t == "D" or new_t == "D": return "D"
	if (new_t == "F" and old_t == "L") or (new_t == "L" and old_t == "F"): return "D"
	if (old_t == "F" and new_t != "L") or (new_t == "F" and old_t != "L"): return "F"
	if (new_t == "L" or old_t == "L"): return "L"
	if (new_t == "I" or old_t == "I"): return "I"
	if (new_t == "S" or old_t == "S"): return "S"
	return "B"

def _get_smallest_fit_type(raw_prim, extra_precise=False):
	if isinstance(raw_prim, bool): return "B"
	if int(raw_prim) != raw_prim:
		if raw_prim == struct.unpack(">f", struct.pack(">f", raw_prim))[0]: return "F" # try float
		else: return "D" # Data did not fit in float: double
	else:
		if extra_precise:
			if raw_prim > -129 and raw_prim < 128: return "B"
			elif raw_prim > -32769 and raw_prim < 32768: return "S"
		if raw_prim > -2147483649 and raw_prim < 2147483648: return "I"
		elif raw_prim > -9223372036854775809 and raw_prim < 9223372036854775808: return "L"

def _lossy_conversion_list(some_list, parent):
	resulting_type = None
	resulting_fam = None
	result_list = []
	for val in some_list:
		if resulting_fam is None:
			resulting_fam = None if val is None else type(val)

		if val is None: # Temporarily use None until we figure out the type.
			if LOSSY_NONE_POLICY is not None:
				result_list.append(None)
		elif isinstance(val, (int, float, bool)) and resulting_fam in (int, float, bool):
			_promote(resulting_type, _get_smallest_fit_type(val))
			result_list.append(val)
		elif isinstance(val, resulting_fam): # Same type family
			if isinstance(val, str):
				resulting_type = "s"
				result_list.append(val)
			elif isinstance(val, list):
				resulting_type = "l"
				res = []
				_lossy_conversion_list(val, res)
				result_list.append(res)
			elif isinstance(val, dict):
				resulting_type = "c"
				res = {}
				for key in val:
					_lossy_conversion(val, res, key)
				result_list.append(res)
		else:
			raise ValueError(f"Type {type(val)} of {val} did not match {resulting_fam}")
	
	if resulting_fam is not None: 
		if LOSSY_NONE_POLICY is not None:
			for i in range(len(result_list)): # Resolve Nones
				if result_list[i] is None:
					if resulting_fam in (int, float, bool): result_list[i] = 0
					elif resulting_fam == str: result_list[i] = ""
					elif resulting_fam == dict: result_list[i] = {}
					elif resulting_fam == list: result_list[i] = []
		result_list.insert(0, [resulting_type]) # prepend with type.
		parent.extend(result_list) # Will never produce BA, IA, LA.
	else:
		parent = [] # Without at least one non-None value, it is ambiguous what kind of list is wanted, so default to empty list.

def _quote_if_necessary(key, force_quote_names=False):
	if force_quote_names or " " in key or "\t" in key or "\n" in key or "\r" in key:
		return f'"{key}"'
	return key

def _show_prim(val, t):
	if t is None: return str(val)
	elif t == "D": return str(val).replace("e+", "E").replace("e-", "E-")
	elif t == "I" or t in ARRAY_TYPES: return str(val)
	elif t == "L": return str(val) + t
	elif t == "F": return str(val).replace("e+", "E").replace("e-", "E-") + t.lower()
	elif t in ("B", "S"): return str(val) + t.lower()
	return str(val) + "<" + str(t) + ">"

def _show(data, force_quote_names=False, sep=(": ", ", ", "; "), braces=('{', '}'), list_type=None):
	string = []
	is_container = True
	for key in data:
		if list_type is None:
			kvpair = []
			kvpair.append(_quote_if_necessary(key, force_quote_names))
			val = data[key]
		else:
			val = key

		if isinstance(val, str):
			val = f'"{val}"'
		elif isinstance(val, list):
			if list_type in ARRAY_TYPES:
				d_type = list_type
				is_container = False
			elif len(val) < 1:
				d_type = ["e"] # Empty list
			else:
				d_type = val[0]
				val = val[1:]

			if isinstance(d_type, list):
				d_type = d_type[0]
				d_len = len(val)

				if d_len > 0: val = _show(val, force_quote_names, sep, ('[', ']'), d_type)
				else: val = '[]'
			elif d_type in ARRAY_TYPES:
				d_len = len(val)

				if d_len > 0: val = _show(val, force_quote_names, sep, ('[', ']'), d_type)
				else: val = f'[{d_type[0] + sep[2]}]'
			else: # Not a list, rather a primitive data type.
				val = _show_prim(val[0], d_type)
		elif isinstance(val, dict):
			val = _show(val, force_quote_names, sep)
		elif isinstance(val, (int, float)):
			val = _show_prim(val, list_type)

		if list_type is None:
			kvpair.append(val)
			string.append(sep[0].join(kvpair))
		else:
			string.append(val)
	if is_container and list_type in ARRAY_TYPES:
		t_spec = list_type[0] + sep[2]
	else: 
		t_spec = ""
	return braces[0] + t_spec + sep[1].join(string) + braces[1]

def _convert_list_to_raw_json(jnbt_list, json_data, nested=False, try_byte=False):
	for val in jnbt_list:
		if isinstance(val, dict):
			json_elem = {}
			_convert_to_raw_json(val, json_elem)
			json_data.append(json_elem)
		elif isinstance(val, list):
			json_elem = []
			if len(val) > 0:
				if nested:
					new_nested = isinstance(val[0], list) and val[0][0] == "l"
					try_byte = isinstance(val[0], list) and val[0][0] == "B"
					_convert_list_to_raw_json(val[1:], json_elem, new_nested, try_byte)
				else:
					_convert_list_to_raw_json(val, json_elem)
			json_data.append(json_elem)
		else:
			if try_byte and (val == 0 or val == 1):
				json_data.append(True if val == 1 else False) # Try to preserve some values.
			else:
				json_data.append(val)


def _convert_to_raw_json(jnbt_data, json_data):
	for key in jnbt_data:
		val = jnbt_data[key]
		if isinstance(val, str):
			json_data[key] = val
		elif isinstance(val, dict):
			json_data[key] = {}
			_convert_to_raw_json(val, json_data[key])
		elif isinstance(val, list):
			json_data[key] = []
			if len(val) > 0:
				if isinstance(val[0], list):
					nested = val[0][0] == "l"
					try_byte = val[0][0] == "B"
					_convert_list_to_raw_json(val[1:], json_data[key], nested, try_byte)
				elif val[0] in ARRAY_TYPES:
					_convert_list_to_raw_json(val[1:], json_data[key])
				else:
					if val[0] == "B" and (val[1] == 0 or val[1] == 1):
						json_data[key] = True if val[1] == 1 else False # Try to preserve some values.
					else:
						json_data[key] = val[1]


################################# UTIL #################################

def header(d_type, name=None):
	if name is None: return b''
	return d_type + struct.pack('>H', len(name)) + as_utf8m(name)

def payload_prim(spf, value):
	return struct.pack(f'>{spf}', value)

def payload_str(value):
	utf8m_string = as_utf8m(value)
	return struct.pack('>H', len(utf8m_string)) + utf8m_string

def read_str(fp):
	size = read_prim(fp, get_info("SST", "US"))
	return from_utf8m(fp.read(size))

def read_prim(fp, t_info):
	return struct.unpack(f'>{t_info["spf"]}', fp.read(t_info["size"]))[0]

def as_utf8m(string):
	return modified_utf8.utf8s_to_utf8m(string.encode("utf8"))

def from_utf8m(byte_string):
	return modified_utf8.utf8m_to_utf8s(byte_string).decode("utf8")

def get_bounded(parent, index):
	lb = -len(parent)
	hb = max(0, len(parent) - 1)
	if index < 0 and index > lb: return parent[index]
	elif index < hb: return parent[index+1]
	else: raise ValueError(f"Index {index} out of bounds {lb}-{hb}")

def safe_get(data, key):
	'''
	Method to safely get jNBT data recursively. (Never work with raw types and __getitem__, always use this on raw types!)
	'''
	if isinstance(key, (list, tuple)):
		new_data = data
		for k in key:
			if isinstance(k, str) and isinstance(data, dict):
				new_data = new_data[k]
			elif isinstance(k, int) and isinstance(data, list):
				new_data = get_bounded(new_data, k)
			else:
				if not isinstance(new_data, (dict, list)):
					raise ValueError(f"Can't index into non dictionary/list type: {type(new_data)}")
				elif isinstance(k, (int, str)):
					raise ValueError(f"Can't index into {type(new_data)} using {type(k)}")
				raise ValueError(f"Unrecognized key/index type: {type(k)}")
		return new_data
	return data[key]


################################# MAIN #################################

def test():
	nbt = NBT("TEST")
	nbt.merge(tag_byte("ByeByte", False))
	nbt.merge(tag_byte("ByeByte2", 127))

	nbt.merge(tag_short("ShorsShort", -32768))
	nbt.merge(tag_short("SureShort", 32767))

	nbt.merge(tag_int("IntegrityInt", -2147483648))
	nbt.merge(tag_int("InternetInt", 2147483647))

	nbt.merge(tag_long("LongLong", 9223372036854775807))
	nbt.merge(tag_long("LittleLong", 12))
	nbt.merge(tag_long("LudicrousLong", False))

	nbt.merge(tag_float("FloatyFloat", 4.2))
	nbt.merge(tag_float("FuriousFloat", 695949392919420410400.5))
	nbt.merge(tag_float("FineFloat", -0.0000000005))


	print(nbt.snbt())

def main():
	import sys
	if len(sys.argv) < 2:
		raise Exception("Missing argument <file>!")
	file = sys.argv[1]
	# nbt = load_nbt(file)
	nbt = load_nbt(file)
	print(nbt)

	with open(file + ".json", 'w+') as f:
		json.dump(nbt.data, f, indent=4, sort_keys=True)

if __name__ == '__main__':
	test()