class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  before_destroy :cancel_orders

  def cancel_orders
    self.orders.map { |order| order.status = 3; order.save}
  end

end
