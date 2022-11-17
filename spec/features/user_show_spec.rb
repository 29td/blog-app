require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users Show', type: :feature do
  before(:each) do
    User.create(name: 'John Doe', posts_counter: 5, id: 352,
                photo: '/assets/icon-c651a4f23e11b63bbbeb45a4ddb3d3a52ec3cc1f40969a503c8f86f0b3ee1962.jpg',
                bio: 'I am John Doe')
    Post.create(title: 'title1', text: 'text1', comments_counter: 0, likes_counter: 0, author_id: 352, id: 1)
    Post.create(title: 'title2', text: 'text2', comments_counter: 0, likes_counter: 0, author_id: 352, id: 2)
    Post.create(title: 'title3', text: 'text3', comments_counter: 0, likes_counter: 0, author_id: 352, id: 3)
    Post.create(title: 'title4', text: 'text4', comments_counter: 0, likes_counter: 0, author_id: 352, id: 4)
    Post.create(title: 'title5', text: 'text5', comments_counter: 0, likes_counter: 0, author_id: 352, id: 5)
  end
  it 'renders the name of the user' do
    visit user_path(352)
    expect(page).to have_content('John Doe')
  end
  it 'renders the bio of the user' do
    visit user_path(352)
    expect(page).to have_content('I am John Doe')
  end
  it 'renders the number of posts of the user' do
    visit user_path(352)
    expect(page).to have_content('5')
  end
  it 'renders the profile picture of the user' do
    visit user_path(352)
    expect(page).to have_css('img')
  end
  it "renders the first 3 of title of the user's posts" do
    visit user_path(352)
    expect(page).to have_content('text1')
    expect(page).to have_content('text2')
    expect(page).to have_content('text3')
  end
  it 'there is button to see all posts' do
    visit user_path(352)
    expect(page).to have_content('See all posts')
  end
end
