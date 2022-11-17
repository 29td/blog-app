require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    User.create(name: 'John Doe', posts_counter: 5, id: 1, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                bio: 'I am John Doe')
    Post.create(title: 'title', text: 'text1', comments_counter: 0, likes_counter: 3, author_id: 1, id: 1)
    Comment.create(author_id: 1, post_id: 1, text: 'comment1')
    Comment.create(author_id: 2, post_id: 1, text: 'comment2')
    visit user_post_path(1, 1)
  end

  it 'renders the title of the post' do
    expect(page).to have_content('title')
  end

  it 'renders the like button' do
    expect(page).to have_content('Like')
  end

  it 'renders the post author' do
    expect(page).to have_content('John Doe')
  end

  it 'renders the name of the user' do
    expect(page).to have_content('John Doe')
  end

  it 'renders the number of likes of the post' do
    expect(page).to have_content('3')
  end

  it 'renders the number of comments of the post' do
    expect(page).to have_content('Comments: 1')
  end

  it 'renders the text of the post' do
    expect(page).to have_content('text1')
  end

  it 'renders the username of the each commenter' do
    expect(page).to have_content('John Doe')
  end

  it 'renders the comments of the each commenter' do
    expect(page).to have_content('comment1')
  end
end
