class GroupsController < ApplicationController

 before_action :set_group, only: %i(show edit update)
 before_action :set_user_groups, only: %i(index show)

 def index
 end

 def new
  @group = Group.new
  @group.group_users.build
 end

 def create
  @group = Group.new(group_params)
   if @group.save
     redirect_to group_path(id: @group.id), notice: "グループを作成しました。"
   else
     render :new
  end
 end

 def show
  @users = @group.users
 end

 def edit
 end

 def update
  if @group.update(group_params)
    redirect_to group_path(id: @group.id), notice: "グループを編集しました。"
  else
    render :edit
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
