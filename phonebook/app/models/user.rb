class User < ApplicationRecord
  has_many :contacts
  has_many :phone_numbers, through :contacts

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
