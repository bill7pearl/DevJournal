require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'PostsConroller' do
    context 'GET index' do
      before(:example) do
        get '/users/1/posts'
      end

      it 'Success response status for index action' do
        expect(response).to be_successful
      end

      it 'Template rendering' do
        expect(response).to render_template(:index)
      end

      it 'should render placeholder text' do
        expect(response.body).to include('All posts')
      end
    end

    context 'GET show action' do
      before(:example) do
        get '/users/1/posts/1'
      end

      it 'Success response for show action' do
        expect(response).to have_http_status(:success)
      end

      it 'Templete rendering for show action' do
        expect(response).to render_template(:show)
      end

      it 'Placeholder rendering' do
        expect(response.body).to include('Selected post')
      end
    end
  end
end
