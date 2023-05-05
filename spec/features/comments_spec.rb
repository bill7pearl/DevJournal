require 'rails_helper'
RSpec.describe 'Comments', type: :request do
  describe 'GET /show' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://picsum.photos/200/500',
                          bio: 'Teacher from Mexico', posts_counter: 0)
      @post1 = Post.create(author: @user, title: 'Test Test', text: 'testtestetst', likes_counter: 0,
                           comments_counter: 0)
      @comment1 = Comment.create(author: @user, post: @post1, text: 'test')
      @comment2 = Comment.create(author: @user, post: @post1, text: 'test2')
      @comment3 = Comment.create(author: @user, post: @post1, text: 'test3')
    end
    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post1.id}",
          params: { id: @comment1.id }, xhr: true
      expect(response).to have_http_status(:success)
    end
  end
end
