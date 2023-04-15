require 'rails_helper'
require 'shoulda/matchers'
require_relative '../../app/models/user.rb'

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
end
