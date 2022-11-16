require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Post Show', type: :request do
  subject { page }

  before(:each) do
    User.create(name: 'John Doe', posts_counter: 5, id: 1, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                bio: 'I am John Doe')
    Post.create(title: 'title1', text: 'text1', comments_counter: 0, likes_counter: 0, author_id: 1, id: 1)
    Like.create(author_id: 1, post_id: 1)
  end

  it 'renders the title of the post' do
    get user_posts_path(1)
    expect(response.body).to include('text1')
  end

  it 'renders the picture of the user' do
    get user_posts_path(1)
    expect(response.body).to include('img')
  end

  it 'renders the number of likes of the post' do
    get user_posts_path(1)
    expect(response.body).to include('0')
  end

  it 'renders the number of comments of the post' do
    get user_posts_path(1)
    expect(response.body).to include('0')
  end

  it 'renders the text of the post' do
    get user_posts_path(1)
    expect(response.body).to include('text1')
  end
end
