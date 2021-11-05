class Crime < ApplicationRecord
  belongs_to :state
# getting every year of a specific crime for a state
  def self.find_line_data (state_id, crime_name)
      crimes_by_year = self.where(state_id: state_id, crime_name: crime_name)
       .pluck("year, pop")
      state_name = State.where("id=#{state_id}").first.name
      label_hash= {state_name=> crime_name}
      # label_hash[state_name] = crime_name
      print([ label_hash, crimes_by_year.to_h.symbolize_keys])
      # return ([crimes_by_year.to_h.symbolize_keys, label_hash])
  
  end

end
