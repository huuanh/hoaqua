class Product < ActiveRecord::Base
  validates :name, presence: true

  def total_like
    Liked.where(product: self).count
  end
end
