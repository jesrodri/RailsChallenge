class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: {scope: :contact, message: 'Phone numbers are unique for each contact.'}
  validates :num_type, inclusion: {in: %w(cellphone home work other), message: 'Choose number type between: cellphone / home / work / other.'}
  validates :main_number, uniqueness: true, if: :main_number==true
end
