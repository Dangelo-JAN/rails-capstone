require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(
      name: 'Fernando',
      email: 'fernando@hello.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @expense = Expense.create(
      name: 'Gas',
      amount: '100',
      user_id: @user.id
    )
  end

  describe 'Expense model' do
    it 'should be valid' do
      expect(@expense).to_not be_valid
    end

    it 'should have a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end
  end
end
