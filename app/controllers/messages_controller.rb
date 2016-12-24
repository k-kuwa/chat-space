class MessagesController < ApplicationController

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
    user = User.includes(:groups).find(current_user.id)
    @group_messages = @group.messages
    @user_groups = user.groups
    @group_users = @group.users
  end

  def create
    @message = Message.create(message_params)
    redirect_to group_messages_path(params[:group_id])
   if @message.save
   else
      flash[:alert] =  'メッセージを入力してください'
   end
  end

 private
  def message_params
     params.require(:message).permit(:body, :image).merge(user_id:current_user.id ,group_id: params[:group_id])
  end

end
