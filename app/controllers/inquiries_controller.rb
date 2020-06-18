class InquiriesController < ApplicationController

	def new
    @inquiry = Inquiry.new
  	end

  	def create
    @inquiry = Inquiry.new(inquiry_params)
    MailSender.inquiry(@inquiry).deliver
    respond_to do |format|
         if @inquiry.save
           format.html { redirect_to root_path, notice: 'お問い合わせメールが送信されました。' }
         else
           format.html { render action: 'new' }
         end
       end
  	end

    private
    def inquiry_params
      params.require(:inquiry).permit(:email, :name, :message)
    end
end
