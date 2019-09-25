class Contact < ActiveRecord::Base
  # Contact form validations
  validates :name, :email, :comments, presence: true
end
  