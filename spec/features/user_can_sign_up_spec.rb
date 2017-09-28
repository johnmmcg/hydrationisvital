require 'rails_helper'

feature 'User can sign up', js: true do
  scenario 'A visitor can sign up when clicking the signup button' do
    visit root_path
    find(:css, 'i.fa.fa-user-plus.icon').click

    expect(page).to have_content('Sign up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Sign up')
  end

  scenario 'A visitor signs up and is sent to dashboard' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Daily goal', with: '12'
    fill_in 'Metric', with: 'cups'

    click_button('Sign up')

    expect(page).to have_content('hi test@gmail.com')
  end

  scenario 'A visitor provides incorrect email' do
    visit new_user_registration_path

    fill_in 'Email', with: 'not a valid email'
    fill_in 'Password', with: 'password'
    fill_in 'Daily goal', with: '12'
    fill_in 'Metric', with: 'cups'

    click_button('Sign up')

    expect(page).to have_content("Sign up")
  end

  scenario 'A visitor provides no email or password' do
    visit new_user_registration_path

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Daily goal', with: '12'
    fill_in 'Metric', with: 'cups'

    click_button('Sign up')

    expect(page).to have_content('Sign up')
    expect(page).to have_content("Email can't be blank, Password can't be blank")
  end

  scenario 'A visitor provides an email already taken' do
    User.create(email: 'test@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_registration_path

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Daily goal', with: '12'
    fill_in 'Metric', with: 'cups'

    click_button 'Sign up'

    expect(page).to have_content('Sign up')
    expect(page).to have_content("Email has already been taken")
  end

  scenario 'A visitor leaves daily goal and metric blank' do
    User.create(email: 'test@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_registration_path

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Daily goal', with: ''
    fill_in 'Metric', with: ''
    click_button 'Sign up'

    expect(page).to have_content('Sign up')
    expect(page).to have_content("Daily goal can't be blank, Metric can't be blank")
  end


end
