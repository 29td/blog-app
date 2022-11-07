class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :comment_counter

  def comment_counter
    post.increment!(:comment_counter)
  end
end
