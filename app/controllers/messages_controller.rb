class MessagesController < ApplicationController
	before_action :authenticate_user!

	def create
	    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
	      @message = Message.create(message_params.merge(:user_id => current_user.id))
	      @messages = @message.room.messages

	      # redirect_to "/rooms/#{@message.room_id}"
	    else
	      redirect_back(fallback_location: users_path)
	    end
  	end

  	private

    def message_params
      params.require(:message).permit(:content, :room_id, :user_id)
    end
end
