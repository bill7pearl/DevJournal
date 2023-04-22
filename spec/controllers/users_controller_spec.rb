require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'UsersController' do
    context 'GET index' do
      before(:example) do
        get '/users'
      end

      it 'index action' do
        expect(response).to have_http_status(:success)
      end

      it 'Templete rendering for index action' do
        expect(response).to render_template(:index)
      end

      it 'Placeholder text for index action' do
        expect(response.body).to include('All users')
      end
    end

    context 'GET show' do
      before(:example) do
        get '/users/1'
      end

      it 'Show action' do
        expect(response).to have_http_status(:success)
      end

      it 'Templete rendering for show action' do
        expect(response).to render_template(:show)
      end

      it 'Rendering placeholder' do
        expect(response.body).to include('Selected user')
      end
    end
  end
end
