require 'rails_helper'

RSpec.describe "UserIndices", type: :feature do
  describe 'Get user index' do
    before(:each) do
      @first_user = User.create(name: 'Jimmy', photo: 'https://unsplash.com/photos/mgAioVzKcjQ',
                                bio: 'I am Jimmy.')
      @second_user = User.create(name: 'Patco', photo: 'https://unsplash.com/photos/mgAioVzKcjQ',
                                 bio: 'I am Patco.')
    end

    scenario 'shows user content on screen' do
      visit users_path
      sleep(8)
      expect(page).to have_content('List of All Users')
    end

    feature 'user index' do
      background { visit users_path }
      scenario 'See all users' do
        expect(page).to have_content('Jimmy')
        expect(page).to have_content('Patco')
      end

      scenario 'See number of posts by each user' do
        expect(page).to have_content('Number of Posts:')
      end

      scenario 'See the profile picture for each user' do
        expect(page.first('img')['src']).to have_content 'https://unsplash.com/photos/mgAioVzKcjQ'
      end

      scenario 'When I click on a user, I am redirected to that user show page' do
        click_link 'Jimmy', match: :first
        expect(current_path).to eq user_path(User.first.id)
      end
    end
  end
end
