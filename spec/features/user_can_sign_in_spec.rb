require 'rails_helper'

feature 'User can sign in', js: true do
  scenario 'A visitor can get to sign in page by clicking on sign in button' do
    visit root_path
    find(:css, 'i.fa.fa-sign-in.icon').click

    expect(page).to have_content('Log in')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  scenario 'A visitor can get to sign in page by clicking log in link on sign up form' do
    visit new_user_registration_path

    click_on 'Log in'

    expect(page).to have_content('Log in')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'A user logs in' do
    @user = User.create(email: 'spec@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button('Log in')

    expect(page).to have_content('hi spec@gmail.com')
  end

  scenario 'A user tries to log in with incorrect email and password' do
    @user2 = User.create(email: 'spec1@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_session_path

    fill_in 'Email', with: 'spec2@gmial.com'
    fill_in 'Password', with: 'passwrod'

    click_button('Log in')

    expect(page).to have_content('Log in')
    expect(page).to have_content('Email')
  end
end
