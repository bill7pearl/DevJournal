FactoryBot.define do
    factory :author, class: 'User' do
      name { 'Bill Pearl' }
      photo { 'https://example.com/photo.jpg' }
      bio { 'lorem ipsum' }
      posts_counter { 0 }
      created_at { Time.now }
      updated_at { Time.now }
    end
  end