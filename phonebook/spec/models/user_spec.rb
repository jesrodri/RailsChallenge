require 'rails_helper'

RSpec.describe User, :type => :model do

  subject {
    User.new( name: 'Sarah', age: 29, bio: 'Love cats and photography.')
  }

  context 'username' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      nameless = User.new(age: 29, bio: 'Love dogs and cinema.')
      expect(nameless).to_not be_valid
    end

    it 'is not valid with a duplicated name' do
      subject.save
      user = User.new( name: 'Sarah', age: 35, bio: 'Love music and skating.')
      expect(user).to_not be_valid
    end
  end

  context 'other attributes' do
    it 'is valid without an age value' do
      john = User.new( name: 'John', age: 40, bio: 'Sports fan in recovery.')
      expect(john).to be_valid
    end

    it 'is valid without a bio' do
      nate = User.new( name: 'Nathan', age: 25)
      expect(nate).to be_valid
    end
  end
end
