class GroupsController < ApplicationController

 before_action :group_find_id, only:[:show, :edit, :update]
 before_action :user_groups, only:[:index, :show]

 def index
 end

 def new
  @group = Group.new
  @group.group_users.build
 end

 def create
   @group = Group.create(group_params)
   if @group.save
    redirect_to group_path(id: @group.id), notice: "グループを作成しました。"
   else
    render :new
  end
 end

 def show
 end

 def edit
 end

 def update
  @group.update(group_params)
  redirect_to group_path(id: @group.id)
 end

private
 def group_params
  params.require(:group).permit(:name, {user_ids: []})
 end

 def group_find_id
  @group = Group.find(params[:id])
 end

 def user_groups
  user = User.includes(:groups).find(current_user.id)
  @user_groups = user.groups
 end
end
