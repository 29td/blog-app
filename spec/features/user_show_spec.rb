require 'rails_helper'

RSpec.describe 'UserShows', type: :feature do
  describe 'Get user show action' do
    before(:each) do
      @first_user = User.create(name: 'Jimmy', photo: 'https://unsplash.com/photos/mgAioVzKcjQ',
                                bio: 'I am Jimmy.')

      @first_post = Post.create(author_id: @first_user, text: 'text', title: 'title')
      @first_post.save
    end

    scenario 'shows user content on screen' do
      visit users_path
      expect(page).to have_content('List of All Users')
    end

    feature 'user show page' do
      background { visit user_path(User.first.id) }
      scenario "I can see the user's profile" do
        expect(page.first('img')['src']).to have_content('https://unsplash.com/photos/mgAioVzKcjQ')
      end

      scenario "I can see the user's username" do
        expect(page).to have_content('Jimmy')
      end

      scenario "I can see the user's bio" do
        expect(page).to have_content('I am Jimmy.')
      end

      scenario "I can see a button that lets me view all of a user's posts" do
        click_link('See All Posts')
        expect(current_path).to eq user_posts_path(User.first.id)
      end
    end
  end
end
