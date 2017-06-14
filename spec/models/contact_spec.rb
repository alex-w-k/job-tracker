require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:company_id) }
  end
  
  describe 'relationships' do
    let(:contact) {Contact.create(full_name: 'Alex Koch',
                                  position: 'CEO',
                                  email: 'ceo@awesome.co',
                                  company_id: 1)}
    it 'belongs to company' do
      expect(contact).to respond_to(:company)
    end
  end
end
