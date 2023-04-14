class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  belongs_to :user

  validates :text, presence: true

  after_create :update_post_comment_counter

  private

  def update_post_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
