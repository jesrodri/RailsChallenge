require 'rails_helper'

RSpec.describe Contact, :type => :model do

  subject {
    User.new( name: 'Sarah', age: 29, bio: 'Love cats and photography.')
  }
  context 'contact name' do
    it 'is valid with valid attributes' do
      subject.save
      keka = subject.contacts.new(name: 'Keka', birthday: 1992-11-9)
      expect(keka).to be_valid
    end

    it 'is not valid without a name' do
      subject.save
      contact = subject.contacts.new
      expect(contact).to_not be_valid
    end

    it 'is not valid with a duplicated name in same user' do
      subject.save
      keka = subject.contacts.create(name: 'Keka', birthday: 1992-11-9)
      keka2 = subject.contacts.create(name: 'Keka', birthday: 1993-11-9)
      expect(keka2).to_not be_valid
    end

    it 'is valid with a duplicated name in another user' do
      subject.save
      user = User.create( name: 'Mary', age: 28, bio: 'Born and raised in Alabama')
      john = subject.contacts.new(name: 'John', birthday: 1994-1-5)
      john2 = user.contacts.new(name: 'John', birthday: 1994-4-30)
      expect(john2).to be_valid
    end
  end
end
