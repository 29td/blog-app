require 'rails_helper'

RSpec.feature 'PostIndices', type: :feature do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(name: 'Jimmy', bio: 'I am Jimmy', posts_counter: 0)
      @post = Post.create(author: @user, title: 'title', text: 'text', likes_counter: 1,
                          comments_counter: 1)
    end

    before { @post.save }
    it 'if there is max 250 characters' do
      @post.title = 'title'
      expect(@post).to be_valid
    end

    it 'if likes counter is integer' do
      @post.likes_counter = 1
      expect(@post).to be_valid
    end
    it 'if likes counter greater than or equal to zero' do
      @post.likes_counter = -2
      expect(@post).to_not be_valid
    end

    it 'if comments counter greater than or equal to zero.' do
      @post.comments_counter = -2
      expect(@post).to_not be_valid
    end

    it 'if comments counter is integer' do
      @post.comments_counter = 1
      expect(@post).to be_valid
    end
  end
end
