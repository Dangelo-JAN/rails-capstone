class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, :icon, presence: true

  def total_amount
    expenses.sum(:amount)
  end

  def total_expenses_count
    expenses.count
  end
end
