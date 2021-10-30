from pdb import set_trace
import us
import requests
import json
# https: // api.census.gov/data/2010/dec/sf1?get = P001001, NAME & for = state: * & key = 1dc4b8e4191b334a04d56e0f4322eec5a0b714d9
censusURL = "https://api.census.gov/data/2015/acs/acs1?get=B02001_001E,B02001_002E,B02001_003E,B02001_004E,B02001_005E,B02001_006E,B02001_007E,B02001_008E,B02001_009E,B02001_010E&for=state:*"

# with open("census_data.json", "w") as o:
x = requests.get(censusURL).json()
r = []
first = True
for e in x:
    if first:
        first = False
        continue

    state = us.states.lookup(e[-1])
    e[-1] = state.name
    if state is None:
        import pdb
        pdb.set_trace()

    e.append(state.abbr)
    r.append(e)


def sorter(x): return (x[10])


sorted_r = sorted(r, key=sorter)
print(len(r))

with open('/Users/willzembricki/Development/Crimereporter2/CR2backend/db/storage/CensusData.json', 'w') as outfile:
    json.dump(r, outfile)
