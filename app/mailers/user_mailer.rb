class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def sample_email(email)
    mail(to: email, subject: 'Sample Email')
  end

end
