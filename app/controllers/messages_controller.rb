class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @messages = Message.where(group_id: params[:group_id])
    respond_to do |format|
      format.html { @message = Message.new}
      format.json {
        array = []
        @messages.each do |message|
          array << {
          name: message.user.name,
          time: message.created_at.strftime("%Y-%m-%d %H:%M:%S"),
          text: message.body,
          image: message.image
          }
        end
          render json:{database: array}
        }
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path}
        format.json {render json: {
          name: current_user.name,
          time: @message.created_at.strftime("%Y-%m-%d %H:%M:%S"),
          text: @message.body
        }
      }
      end
    else
      redirect_to group_messages_path, alert: 'メッセージを入力してください'
    end
  end

 private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id:current_user.id ,group_id: params[:group_id])
  end

end
