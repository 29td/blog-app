require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users Index', type: :feature do
  before(:each) do
    User.create(name: 'John Doe', posts_counter: 5, id: 352, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'Jane Doe', posts_counter: 2, id: 353, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'John Smith', posts_counter: 9, id: 354, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'Jane Smith', posts_counter: 4, id: 355, photo: 'https://i.imgur.com/1J3wZQx.jpg')
  end
  it 'assigns all users to @users' do
    visit users_path
    expect(page).to have_content(User.name)
  end
  it 'renders the name of the users' do
    visit users_path
    expect(page).to have_content('John Doe')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('John Smith')
    expect(page).to have_content('John Smith')
  end
  it 'shows number of posts of user' do
    visit users_path
    expect(page).to have_content('Number of posts: 5')
  end
  it 'renders the profile picture of the users' do
    visit users_path
    expect(page).to have_css('img')
  end
end
