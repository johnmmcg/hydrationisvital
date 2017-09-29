require 'rails_helper'

feature 'user data from previous days', js: true do
  before(:each) do
    @user = User.create(email: 'data@gmail.com', password: 'password', daily_goal: 12, metric: 'cups')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    find('input[name="commit"]').click
  end

  scenario 'new user loads dashboard, can see day and data' do
    visit user_path(@user)

    expect(page).to have_content(Date.today.strftime('%A').downcase)
    expect(page).to have_content(Date.today.strftime('%m/%d/%Y'))

    expect(page).to have_content(Date.today.strftime('%a').downcase)
    expect(page).to have_content((Date.today-1).strftime('%a').downcase)
    expect(page).to have_content((Date.today-2).strftime('%a').downcase)
    expect(page).to have_content((Date.today-3).strftime('%a').downcase)

    visit user_path(@user)

    find('i.fa.fa-sign-out.icon').click
  end
end
