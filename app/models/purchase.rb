class Purchase < ActiveRecord::Base
  belongs_to :user
  validates :description, :presence => true, :length => { :maximum => 100 }
  validates :amount, :presence => true
  validates :user, :presence => true
end
