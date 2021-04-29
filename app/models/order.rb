class Order < ApplicationRecord
  enum status: { waiting_for_payment: 0, waiting_for_shipping: 1, payment_completed: 2, order_cancelled: 3 }

  belongs_to :user
  belongs_to :product

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validate :possible_amount

  def possible_amount
    if amount > product.stock
      errors.add(:amount, "amount value mustn't have more than item stock value")
    end
  end
end