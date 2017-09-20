require 'rails_helper'

RSpec.feature 'UsersController' do
  before(:each) do
    @day = Day.create(date: Date.today)
    10.times do
      User.create(email: Faker::Internet.email, password: 'password', daily_goal: rand(7..15) )
    end
    5.times do
      UserDay.create(user_id: rand(1..10), day_id: @day.id, amount: rand(7..15))
    end

  end

  scenario 'list of users on index' do
    visit api_v1_users_path

    expect(page).to have_content('email')
    expect(page).to have_content('daily_goal')
    expect(page).to have_content('metric')
  end

  scenario 'list of user_days on user show' do
    @user1 = User.create(email: 'user1@gmail.com', password: 'password', daily_goal: 14, metric: 'fl oz')
    @day1 = Day.create(date: Date.new(rand(1000)))
    2.times do
      UserDay.create(user_id: @user1.id, day_id: @day1.id, amount: 15)
    end
    2.times do
      UserDay.create(user_id: @user1.id, day_id: @day1.id, amount: 13)
    end
    
    visit api_v1_user_path(@user1.id)

    expect(page).to have_content('email')
    expect(page).to have_content('daily_goal')
    expect(page).to have_content('day')
    expect(page).to have_content('metric')
    expect(page).to have_content('amount')

    expect(page).to have_content(15)
    expect(page).to have_content(13)
  end

end
