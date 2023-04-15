require 'rails_helper'
require_relative '../../app/models/comments.rb'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(
      post: Post.new(
        author: User.new(
          name: 'Billy',
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'Test bio',
          posts_counter: 0
        ),
        title: 'Test title',
        text: 'Lorem ipsum',
        likes_counter: 0,
        comments_counter: 0
      ),
      author: User.new(name: 'Smith', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'test new bio ', posts_counter: 0), text: 'test a new comment'
    )
  end

  before { subject.save }

  it 'update_comments_counter should return a correct result when calling it with after_save' do
    expect(subject.post.comments_counter).to eq(1)
  end
end
