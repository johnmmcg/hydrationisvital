require 'rails_helper'

RSpec.feature 'UserDaysController' do
  before(:each) do
    @user = User.create(email: 'test@gmail.com', password: 'password', daily_goal: 13)
    @user2 = User.create(email: 'example@gmail.com', password: 'password', daily_goal: 9)
    @day = Day.create(date: Date.today)
    @day2 = Day.create(date: Date.new(rand(1000)))
    @ud1 = UserDay.create(user_id: @user.id, day_id: @day.id, amount: 10)
    @ud2 = UserDay.create(user_id: @user2.id, day_id: @day2.id, amount: 3)
  end

  scenario 'send a list of all user_days to index' do
    visit api_v1_user_days_path

    expect(page).to have_content('user_id')
    expect(page).to have_content(@user.id)
    expect(page).to have_content(@user2.id)

    expect(page).to have_content('amount')
    expect(page).to have_content('10')
    expect(page).to have_content('3')
  end

  scenario 'send a data of a user_day to show' do
    visit api_v1_user_day_path(@ud1.id)

    expect(page).to have_content('email')
    expect(page).to have_content('test@gmail.com')

    expect(page).to have_content("date")
    expect(page).to have_content(Date.today)

    expect(page).to have_content('amount')
    expect(page).to have_content('10')
  end
end
