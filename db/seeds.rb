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
            pop:state[0].to_i,
            asian_pop:state[4].to_i,
            hawaiian:state[5].to_i,
            black:state[2].to_i,
            american_indian:state[3].to_i,
            white:state[1].to_i,
            unknown: (state[6].to_i+state[7].to_i+state[8].to_i+state[9].to_i),
            year: 2015
        )
    end

states.each.with_index do |state,si|
    crimes.each.with_index do |crime,ci| 
        
        arrestsRace = JSON.parse(File.read("/Users/willzembricki/Development/Crimereporter2/CR2backend/db/storage/fbiData/#{state}_#{crime}.json"))
        # arrestsGender = JSON.parse(File.read("db/datafiles-gender/#{state}_#{crime}.json"))
        arrestsRace["results"].each do |arrest_item|
            totalPop = arrest_item["asian"] + arrest_item["native_hawaiian"] + arrest_item["black"] + arrest_item["american_indian"] + arrest_item["unknown"] + arrest_item["white"]
           crimeRecord = Crime.create(  
                            state_id: si + 1,
                            crime_name: crime,
                            pop: totalPop,
                            asian_pop: arrest_item["asian"],
                            hawaiian: arrest_item["native_hawaiian"],
                            black:arrest_item["black"],
                            american_indian: arrest_item["american_indian"],
                            unknown:arrest_item["unknown"],
                            white:arrest_item["white"],
                            year: arrest_item["data_year"].to_i
                            )
                       

        
        end
    end
end