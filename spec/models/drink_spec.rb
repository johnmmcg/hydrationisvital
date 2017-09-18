require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe Drink do
    it {should have_valid(:ammount).when(3)}
    it {should_not have_valid(:ammount).when(nil, "")}

    it {should have_valid(:user_day_id).when(2)}
    it {should_not have_valid(:user_day_id).when(nil, "")}

    it {should belongs_to():user_day)}
  end
end
