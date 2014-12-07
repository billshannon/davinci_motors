require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')

    within('#my_cars') do
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('$2,300')
    end
  end

  scenario 'can create a second car' do
    Car.create(
      make: 'Ford',
      model: 'Mustang',
      year: '1967',
      price: '2300'
    )

    visit '/'

    within('#my_cars') do
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('$2,300')
    end

    click_link 'New Car'

    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camary'
    fill_in 'Year', with: '1987'
    fill_in 'Price', with: '4500'

    click_button 'Create Car'

    expect(page).to have_content('1987 Toyota Camary created')

    expect(page).to have_selector('#my_cars tr', :count => 3)

    within('#my_cars') do
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('$2,300')

      expect(page).to have_content('Toyota')
      expect(page).to have_content('Camary')
      expect(page).to have_content('1987')
      expect(page).to have_content('$4,500')
    end
  end
end
