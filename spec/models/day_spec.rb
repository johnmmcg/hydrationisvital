require 'rails_helper'

RSpec.describe Day, type: :model do
  describe Day do
    it {should have_valid(:date).when(Date.today)}
    it {should_not have_valid(:date).when(nil, "")}
  end
end
