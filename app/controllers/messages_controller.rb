class MessagesController < ApplicationController

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @message = Message.create(message_params)
    redirect_to group_messages_path(params[:group_id])
    flash[:alert] = 'メッセージを入力してください' unless @message.save
  end

 private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id:current_user.id ,group_id: params[:group_id])
  end

end
