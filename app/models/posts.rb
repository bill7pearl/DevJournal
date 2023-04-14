class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_latest_comments
    comments.order('created_at DESC').limit(5)
  end

  def update_posts_counter
    update_attribute(:posts_counter, posts.count)
  end

  def five_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
