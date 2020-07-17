class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :city
    validates :house_number
    validates :phone_number
  end
end



