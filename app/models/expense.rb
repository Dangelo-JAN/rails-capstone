class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, :amount, presence: true
end
