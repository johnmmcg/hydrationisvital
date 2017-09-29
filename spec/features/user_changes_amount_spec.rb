require 'rails_helper'

feature 'User can change amount', js: true do
  before(:each) do
    @user = User.create(email: 'amount@gmail.com', password: 'password', daily_goal: 10, metric: 'cups')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    find('input[name="commit"]').click
  end

  scenario 'user can add 10, and reaches goal' do
    visit user_path(@user)

    find('i.fa.fa-angle-up.ten').click

    expect(page).to have_content('10')
    expect(page).to have_content('100%')
    expect(page).to have_content('Congrats! You completed your hydration goal for today.')
  end

  scenario 'user can add 1' do
    visit user_path(@user)

    find('i.one.fa.fa-angle-up').click

    expect(page).to have_content('1')
    expect(page).to have_content('10%')
  end

  scenario 'user can subtract 10, and takes away goal' do
    visit user_path(@user)

    find('i.fa.fa-angle-up.ten').click

    expect(page).to have_content('10')
    expect(page).to have_content('100%')
    expect(page).to have_content('Congrats! You completed your hydration goal for today.')

    find('i.fa.fa-angle-down.ten').click
    expect(page).to have_content('0')
    expect(page).to have_content('0%')
    expect(page).to have_content('Drink some water!')

    expect(page).not_to have_content('Congrats! You completed your hydration goal for today.')
  end

  scenario 'user can subtract 1' do
    visit user_path(@user)

    find('i.fa.fa-angle-up.ten').click

    find('i.one.fa.fa-angle-down').click

    expect(page).to have_content('9')
    expect(page).to have_content('90%')

    expect(page).not_to have_content('Congrats! You completed your hydration goal for today.')
  end

  scenario 'when user subtracts 10 from amount less than 10, amount goes to zero' do
    visit user_path(@user)

    find('i.fa.fa-angle-up.ten').click

    find('i.one.fa.fa-angle-down').click

    find('i.fa.fa-angle-down.ten').click
    expect(page).to have_content('0')
    expect(page).to have_content('0%')
    expect(page).to have_content('Drink some water!')

    expect(page).not_to have_content('Congrats! You completed your hydration goal for today.')
  end
end
