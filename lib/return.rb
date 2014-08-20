class Return < ActiveRecord::Base
  belongs_to :purchase
  has_many :products, through: :purchase
end
