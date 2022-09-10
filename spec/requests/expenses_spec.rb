require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  include Warden::Test::Helpers

  before :each do
    @user = User.create(
      name: 'name',
      email: 'test@email.com',
      password: '123456',
      password_confirmation: '123456'
    )

    login_as(@user, scope: :user)

    @group = Group.create(
      name: 'Ruby',
      icon: 'ruby',
      user_id: @user.id
    )

    @expense = Expense.create(
      name: 'Gas',
      amount: '100',
      user_id: @user.id,
      group_id: @group.id
    )
  end

  describe 'GET #index' do
    it 'should return a success response' do
      get group_expenses_path(@group)
      expect(response).to be_successful
    end

    it 'should return a 200 response' do
      get group_expenses_path(@group)
      expect(response).to have_http_status '200'
    end

    it 'should return a list of expenses' do
      get group_expenses_path(@group)
      expect(response.body).to include @expense.name
    end
  end
end
