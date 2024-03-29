require 'test_helper'

class PurchaseRecordingTest < ActionDispatch::IntegrationTest
  javascript
  
  setup do
    login
  end
  
  test "creating a new purchase" do
    # debugger;1
    visit purchases_path
    click_link 'new-purchase-link'
    fill_in "Description", with: "Spam"
    click_button "Create Purchase"
    
    error_message = "Amount can't be blank"
    # debugger;1
    assert page.has_content?(error_message)
  end
end
