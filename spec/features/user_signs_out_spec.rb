require 'rails_helper'

feature 'User can sign out', js: true do
  before(:each) do
    @user = User.create(email: 'signout@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    find('input[name="commit"]').click
  end

  scenario 'user can sign out after login in' do
    visit user_path(@user)

    find('i.fa.fa-sign-out.icon').click

    expect(page).to have_content('Signed out successfully.')
  end

end
