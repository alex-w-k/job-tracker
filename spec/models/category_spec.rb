require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end
  describe 'relationships' do
    let(:category) {Category.create(title: 'DevOps')}

    it 'has_many jobs' do
      expect(category).to respond_to(:jobs)
    end
  end
end
