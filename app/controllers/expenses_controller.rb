class ExpensesController < ApplicationController
  def index
    @expenses = Expense.where(group: params[:group_id], user: current_user)
    @group = Group.find(params[:group_id])
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = Expense.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = Expense.new(entity_params)
    @expense.user_id = current_user.id
    @expense.group_id = @group.id
    if expense.valid?
      expense.save
      redirect_to group_expenses_path
    else
      redirect_to new_group_expense_path, alert: @expense.errors.first.message, status: 400
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end