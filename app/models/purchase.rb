class Purchase < ActiveRecord::Base
  belongs_to :user
  validates :description, :presence => true, :length => { :maximum => 100 }
  validates :amount, :presence => true
  validates :user, :presence => true
  acts_as_taggable
  
  def self.recent
    where("purchases.created_at >= ?", 14.days.ago)
  end
  
end
