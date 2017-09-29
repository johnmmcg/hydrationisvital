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

    expect(page).not_to have_content('"date"')
    expect(page).not_to have_content('"amount"')
  end

  scenario 'list of user_days data on user show' do
    @user1 = User.create(email: 'user1@gmail.com', password: 'password', daily_goal: 14, metric: 'fl oz')
    @day1 = Day.create(date: Date.new(rand(1000)))
    2.times do
      UserDay.create(user_id: @user1.id, day_id: @day1.id, amount: 13)
    end

    @user2 = User.create(email: 'user2@gmail.com', password: 'password', daily_goal: 12, metric: 'cups')

    visit api_v1_user_path(@user1.id)

    expect(page).to have_content("email")
    expect(page).to have_content(@user1.email)
    expect(page).to have_content('daily_goal')
    expect(page).to have_content('14')
    expect(page).to have_content('day')
    expect(page).to have_content('metric')
    expect(page).to have_content('fl oz')
    expect(page).to have_content('amount')
    expect(page).to have_content('13')
    expect(page).to have_content('today')
    expect(page).to have_content(Date.today)
    expect(page).to have_content('user_days')
    expect(page).to have_content('recent_days')
    expect(page).to have_content(Date.yesterday)
    expect(page).to have_content(15)

    expect(page).not_to have_content(@user2.email)
    expect(page).not_to have_content(@user2.metric)
  end

end
