class Purchase < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
  has_many :returns
end
