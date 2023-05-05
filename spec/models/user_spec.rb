require 'rails_helper'
require 'shoulda/matchers'
require_relative '../../app/models/user'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy).class_name('Post').with_foreign_key('author_id') }
    it { should have_many(:comments).dependent(:destroy).class_name('Comment').with_foreign_key('author_id') }
    it { should have_many(:likes).dependent(:destroy).class_name('Like').with_foreign_key('author_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'three_latest_posts' do
    let(:user) { create(:author) }
    let!(:post1) { create(:post, author: user, created_at: 1.day.ago) }
    let!(:post2) { create(:post, author: user, created_at: 2.days.ago) }
    let!(:post3) { create(:post, author: user, created_at: 3.days.ago) }
    let!(:post4) { create(:post, author: user, created_at: 4.days.ago) }

    it 'returns the three most recent posts' do
      expect(user.three_latest_posts).to eq([post1, post2, post3])
    end

    it 'does not include posts that are older than the three most recent' do
      expect(user.three_latest_posts).not_to include(post4)
    end
  end
end
