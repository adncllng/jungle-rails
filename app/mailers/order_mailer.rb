class OrderMailer < ApplicationMailer
  default from: "from@example.com"


    def receipt_email(order)
      @order = order
      mail(to: @order.email, subject: 'Sample Email')
    end
end
