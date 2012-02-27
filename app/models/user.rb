class User < ActiveRecord::Base
  belongs_to :household
  has_many :purchases
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i }
  validates :household, :presence => true
end
