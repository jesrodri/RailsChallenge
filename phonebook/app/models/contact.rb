class Contact < ApplicationRecord
  belongs_to :user
  has_many :phone_numbers

  validates :name, presence: true, uniqueness: {scope: :user, message: 'Contact names are unique for each user.', case_sensitive: false}
end
