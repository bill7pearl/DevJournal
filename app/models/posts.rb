class Post < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :user
    has_many :likes
    has_many :comments
  
    def update_posts_counter
      self.update_attribute(:posts_counter, self.posts.count)
    end
  
    def five_recent_comments
        comments.order('created_at DESC').limit(5)
    end

  end
  