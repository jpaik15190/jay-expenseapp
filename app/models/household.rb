class Household < ActiveRecord::Base
  validates :address, :presence => true, :uniqueness => true
  has_many :users
  has_many :purchases, through: :users
end
