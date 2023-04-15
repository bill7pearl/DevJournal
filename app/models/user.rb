class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments,  dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end