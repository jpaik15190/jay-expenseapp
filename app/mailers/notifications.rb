class Notifications < ActionMailer::Base
  default from: "notifications@jay-expenses.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_purchase.subject
  #
  def new_purchase(purchase)
    @purchase = purchase
    mail to: purchase.user.email
  end
end
