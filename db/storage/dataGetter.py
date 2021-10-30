# class dataGetter < ApplicationRecord
# require 'httparty'
# statesArray = ["OR,"AR","IA,"KS","CO"]
# crimesArray = ["drug-possession-marijuana","drug-possession-opium","drug-possession-synthetic","drug-possession-other","drug-sales-marijuana","drug-sales-opium","drug-sales-synthetic","drug-sales-other"]

# response = HTTParty


# end

import requests
states = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO",
          "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]
crimes = ["drug-possession-marijuana", "drug-possession-opium", "drug-possession-synthetic",
          "drug-possession-other", "drug-sales-marijuana", "drug-sales-opium", "drug-sales-synthetic", "drug-sales-other"]
ROOT_DIR = "/Users/willzembricki/Development/Crimereporter2/CR2backend/db/storage/fbiData"

for state in states:
    for crime in crimes:
        url = f"https://api.usa.gov/crime/fbi/sapi/api/data/arrest/states/{state}/{crime}/race/1995/2019?API_KEY=QNuv6qnMvVNndAojyPwzXOl4SHy3DWvWXTaw7PFM"
        with open(f"{ROOT_DIR}/{state}_{crime}.json", "w") as o:
            o.write(requests.get(url).text)
