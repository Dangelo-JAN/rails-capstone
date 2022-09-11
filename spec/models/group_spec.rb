require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(
      name: 'name',
      email: 'test@email.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  describe 'User model' do
    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should have a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'should have an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'should have a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'should have a unique name' do
      @user2 = User.create(
        name: 'name',
        email: 'test@email.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user2).to_not be_valid
    end
  end
end
