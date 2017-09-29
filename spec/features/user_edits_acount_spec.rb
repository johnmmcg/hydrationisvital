require 'rails_helper'

feature 'User can change amount', js: true do
  before(:each) do
    @user = User.create(email: 'edit@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    find('input[name="commit"]').click
  end

  scenario 'user accesses edit page and go back' do
    visit user_path(@user)

    find('i.fa.fa-wrench.icon').click

    expect(page).to have_content('Edit Account')

    click_on('go back')

    expect(page).to have_content(@user.daily_goal)
    expect(page).to have_content(@user.metric)

    visit user_path(@user)

    find('i.fa.fa-sign-out.icon').click
  end

  scenario 'user successfully edits account' do
    visit edit_user_registration_path

    fill_in 'Daily goal', with: '140'
    fill_in 'Metric', with: 'fl oz'

    click_on('Update')

    expect(page).to have_content('success!')
    expect(page).to have_content('140')
    expect(page).to have_content('fl oz')
    expect(page).not_to have_content('Log in')
    expect(page).not_to have_content('Sign up')

    visit user_path(@user)

    find('i.fa.fa-sign-out.icon').click
  end

  scenario 'A user provides no daily goal or metric' do
    visit edit_user_registration_path

    fill_in 'Email', with: 'edit@gmail.com'
    fill_in 'Daily goal', with: ''
    fill_in 'Metric', with: ''

    click_on('Update')

    expect(page).to have_content('Edit Account')
    expect(page).to have_content("Daily goal can't be blank, Metric can't be blank")

    visit user_path(@user)

    find('i.fa.fa-sign-out.icon').click
  end

  scenario 'A user deletes account' do
    visit edit_user_registration_path

    accept_alert do
      click_on('Delete')
    end

    expect(page).to have_content('hydration is vital')
    expect(User.count).to eq(0)
  end
end
