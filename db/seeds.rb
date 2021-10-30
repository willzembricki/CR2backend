# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
crimes = ["drug-possession-marijuana","drug-possession-opium","drug-possession-synthetic","drug-possession-other","drug-sales-marijuana","drug-sales-opium","drug-sales-synthetic","drug-sales-other"]
states = ["AL", "AK","AZ", "AR", "CA", "CO", "DE","CT",  "FL", "GA", "HI",  "ID", "IL", "IN", "IA","KS", "KY", "LA","ME","MD", "MA", "MI", "MN", "MS", "MO",
          "MT","NE","NV", "NH","NJ", "NM","NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX","VT", "UT", "VA",  "WA","WV", "WI",  "WY"]

stateData = JSON.parse(File.read("/Users/willzembricki/Development/Crimereporter2/CR2backend/db/storage/CensusData.json"))

    stateData.each.with_index do |state,ci |
    
        State.create(
        
            name: state[10],
            abbv: state[11],
            pop:state[0],
            asian_pop:state[4],
            hawaiian:state[5],
            black:state[2],
            american_indian:state[3],
            white:state[1],
            # unknown: state[6]+state[7]+state[8]+state[9])
        )
    end

states.each.with_index do |state,si|
    crimes.each.with_index do |crime,ci| 
        
        arrestsRace = JSON.parse(File.read("/Users/willzembricki/Development/Crimereporter2/CR2backend/db/storage/fbiData/#{state}_#{crime}.json"))
        # arrestsGender = JSON.parse(File.read("db/datafiles-gender/#{state}_#{crime}.json"))
        arrestsRace["results"].each do |arrest_item|
            totalPop = arrest_item["asian"] + arrest_item["native_hawaiian"] + arrest_item["black"] + arrest_item["american_indian"] + arrest_item["unknown"] + arrest_item["white"]
           crime = OffenderRecord.create(state_id: si + 1, 
                            crimeName: crime,
                            totalPopO: totalPop,
                            asianPopO: arrest_item["asian"],
                            native_hawaiianO: arrest_item["native_hawaiian"],
                            blackO:arrest_item["black"],
                            american_indianO: arrest_item["american_indian"],
                            unknownO:arrest_item["unknown"],
                            whiteO:arrest_item["white"],
                            year: arrest_item["data_year"].to_i
                            )
        print(crime)
        end
    end
end