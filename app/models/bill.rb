class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def money
    self.product.price.to_i * self.number
  end
end
