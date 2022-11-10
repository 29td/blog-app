class Likes < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :likes_counter

  def likes_counter
    post.increment!(:Likes_counter)
  end
end
