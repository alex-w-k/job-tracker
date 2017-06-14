class Contact < ActiveRecord::Base
  validates :full_name, :email, :position, :company_id, presence: true
  belongs_to :company
end
