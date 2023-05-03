require 'rails_helper'
require_relative '../../app/models/like'
require_relative '../../app/models/post'

RSpec.describe Like, type: :model do
  subject do
    Like.new(
      post: Post.new(
        author: User.new(
          name: 'Billy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo.png',
          bio: 'full-stack Webapp developer',
          posts_counter: 0
        ), title: 'Test', text: 'Lorem ipsum dilor',
        likes_counter: 0, comments_counter: 0
      ),
      author: User.new(name: 'Testname', photo: 'example.png', bio: 'Example bio',
                       posts_counter: 0)
    )
  end

  before { subject.save }

  it 'update_comments_counter should return a correct result when called before save' do
    expect(subject.post.likes_counter).to eq(1)
  end
end
