require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'relationships' do
    let(:comment) {Comment.create(title: 'Awesome', body: 'Really great!', job_id: 1)}

    it 'belongs to jobs' do
      expect(comment).to respond_to(:job)
    end
  end
end
