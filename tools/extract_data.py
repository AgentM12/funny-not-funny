
import os
import json
import nbt_tools as nbt
from time import strftime

nbt_location = "../worlds/world_research/data/command_storage_fnf.dat"
scores_location = "../worlds/world_research/data/scoreboard.dat"
data_location = "data_archive"

save_data_file_location = "../data/"

tracked_scores = {
	"fnf_rounds": "total_rounds_played",
	"fnf_spec_rounds": "total_rounds_spectated",
	"fnf_votes_cast": "total_votes_cast",
	"fnf_votes_recv": "total_votes_received"
}

def extract_stats():
	nbt_data = nbt.load_nbt(scores_location)
	
	player_scores = nbt.NBT('data')
	player_scores.data['data'] = nbt_data['data']['PlayerScores']
	
	list_of_player_scores = player_scores.as_dict()['data']

	result_dict = {}

	for entry in list_of_player_scores:
		if entry["Objective"] in tracked_scores:
			if not (entry["Name"] in result_dict):
				result_dict[entry["Name"]] = {}
			result_dict[entry["Name"]][tracked_scores[entry["Objective"]]] = entry["Score"]

	return list(result_dict.values())
	
def extract_game_data():
	nbt_data = nbt.load_nbt(nbt_location)
	game_data = nbt.NBT('data')
	game_data.data = nbt_data['data']['contents'][data_location]
	return game_data.as_dict()

def clean(data):
	raw_prompts = {}
	games = []
	for game in data['Games']:
		max_votes = game['MaxVotes'] # The most votes that could be received per prompt in that game. (players + spectators - 2)
		prompts = []
		for prompt in game['Prompts']:
			try:
				prompt_key = json.loads(prompt['Prompt'])['text'].strip()
			except:
				continue

			try: ans1_key = json.loads(prompt['Answer1'])['text'].strip()
			except: ans1_key = ""
			
			try: ans1_votes = int(prompt['A1_VOTES'])
			except: ans1_votes = 0

			try: ans2_key = json.loads(prompt['Answer2'])['text'].strip()
			except: ans2_key = ""

			try: ans2_votes = int(prompt['A2_VOTES'])
			except: ans2_votes = 0

			if not (prompt_key in raw_prompts):
				raw_prompts[prompt_key] = {}

			for key, votes in {ans1_key: ans1_votes, ans2_key: ans2_votes}.items():
				if key is not None:
					if not (key in raw_prompts[prompt_key]):
						raw_prompts[prompt_key][key] = []
					raw_prompts[prompt_key][key].append(f"{votes}/{max_votes}")
			
			prompts.append({
				'prompt': prompt_key,
				'answer1': {
					'text': ans1_key,
					'votes': ans1_votes
				},
				'answer2': {
					'text': ans2_key,
					'votes': ans2_votes
				}
			})

		games.append({
			'max_votes_per_round': max_votes,
			'prompts': prompts
		})
			
	return games, raw_prompts


def main():
	player_stats = extract_stats()
	games, raw_prompts = clean(extract_game_data())

	data = {
		"player_stats": player_stats,
		"prompts": raw_prompts,
		"per_game": games
	}
	
	os.makedirs(save_data_file_location, exist_ok=True)
	date_time = strftime("%Y%m%d_%H%M%S")
	with open(os.path.join(save_data_file_location, '{}.json'.format(date_time)), 'w+') as f:
		json.dump(data, f, indent=4)
	


if __name__ == '__main__':
	main()