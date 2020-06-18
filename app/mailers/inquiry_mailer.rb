class InquiryMailer < ApplicationMailer
	def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to:   ENV['KEY'],
      subject: 'Cafegraphyお問い合わせ通知'
    )
  end
end
