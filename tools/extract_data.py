
import os
import json
import nbt_tools as nbt

nbt_location = "../worlds/world_research/data/command_storage_fnf.dat"
data_location = "data_archive"

save_data_file_location = "data/"

data_titles = ["Prompt", "Answer 1", "Answer 1 Votes", "Answer 2", "Answer 2 Votes"]
data_keys = ["Prompt", "Answer1", "A1_VOTES", "Answer2", "A2_VOTES"]


def extract_game_data():
	nbt_data = nbt.load_nbt(nbt_location)
	game_data = nbt.NBT('data')
	game_data.data = nbt_data['data']['contents'][data_location]
	return game_data.as_dict()

def clean(data):
	prompts = {}
	for game in data['Games']:
		for prompt in game['Prompts']:
			try:
				prompt_key = json.loads(prompt['Prompt'])['text'].strip()
			except:
				continue

			try:
				ans1_key = json.loads(prompt['Answer1'])['text'].strip()
				ans1_votes = int(prompt['A1_VOTES'])
			except:
				ans1_key = None

			try:	
				ans2_key = json.loads(prompt['Answer2'])['text'].strip()
				ans2_votes = int(prompt['A2_VOTES'])
			except:
				ans2_key = None
			
			
			if (prompt_key in prompts):
				if ans1_key is not None: prompts[prompt_key][ans1_key] = prompts[prompt_key].get(ans1_key, 0) + ans1_votes
				if ans2_key is not None: prompts[prompt_key][ans2_key] = prompts[prompt_key].get(ans2_key, 0) + ans2_votes
			else:
				answers = {}
				if ans1_key is not None: answers[ans1_key] = ans1_votes
				if ans2_key is not None: answers[ans2_key] = ans2_votes

				prompts[prompt_key] = answers
			
	return prompts


def main():
	data = extract_game_data()
	cleaned_data = clean(data)
	os.makedirs(save_data_file_location, exist_ok=True)
	with open(os.path.join(save_data_file_location, 'data.json'), 'w+') as f:
		json.dump(cleaned_data, f, indent=4)
	


if __name__ == '__main__':
	main()