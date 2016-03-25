class Product < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :img_link, ImageUploader

  def total_like
    Liked.where(product: self).count
  end
end
