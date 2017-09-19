require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it {should have_many(:user_days)}
    it {should have_many(:drinks)}
    it {should have_many(:days).through(:user_days)}
  end
end
