require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test "ensure we have an amount" do
  	attrs = { description: "Empty amount", amount: nil }
  	purchase = Purchase.new(attrs)
  	assert !purchase.valid?
  end  
end
