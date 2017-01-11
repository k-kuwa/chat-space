class GroupsController < ApplicationController

 before_action :set_group, only: %i(edit update)
 before_action :set_user_groups, only: %i(index)

 def index
 end

 def new
  @group = Group.new
  @group.group_users.build
 end

 def create
  @group = Group.new(group_params)
   if @group.save
     redirect_to group_messages_path(group_id: @group.id), notice: "グループを作成しました。"
   else
     render :new
   end
 end

 def edit
 end

 def update
  if @group.update(group_params)
    redirect_to group_messages_path(group_id: @group.id), notice: "グループを編集しました。"
  else
    render :edit
  end
 end

 def search
  @users = User.where('name LIKE(?)',"%#{params[:username]}%")
  respond_to do |format|
        format.json {render json: @users}
  end
 end

private
 def group_params
  params.require(:group).permit(:name, {user_ids: []})
 end

 def set_group
  @group = Group.find(params[:id])
 end

 def set_user_groups
  user = User.includes(:groups).find(current_user.id)
  @user_groups = user.groups
 end
end
