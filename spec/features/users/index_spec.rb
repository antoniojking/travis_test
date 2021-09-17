require 'rails_helper'

RSpec.describe 'User Index Page' do
  it 'displays users with attributes' do
    user1 = User.create(name: 'Antonio', age: 33, location: 'Longmont, CO')
    user2 = User.create(name: 'Michael', age: 40, location: 'Seattle, WA')

    visit users_path

    expect(current_path).to eq(users_path)
    expect(page).to have_content('User Index Page')

    User.all.each do |user|
      within "#user-#{user.id}" do
        expect(page).to have_content(user.name)
        expect(page).to have_content(user.age)
        expect(page).to have_content(user.location)
      end
    end
  end
end
