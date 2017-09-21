require 'rails_helper'

RSpec.describe UserDay, type: :model do
  describe UserDay do
    it {should belong_to(:user)}
    it {should belong_to(:day)}
  end
end
