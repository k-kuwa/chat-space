class GroupsController < ApplicationController

 def new
  @group = Group.new
  @group.group_users.build
 end

 def create
  @group = Group.create(group_params)
  redirect_to "/groups/#{@group.id}"
 end

 def show
  @group = Group.find(params[:id])
  @user_group = Group.includes(:users).where('user.id'== current_user.id)
 end

 def edit
  @group = Group.find(params[:id])
 end

 def update
  group = Group.find(params[:id])
  group.update(group_params)
  redirect_to "/groups/#{group.id}"
 end

 private
 def group_params
  params.require(:group).permit(:name, {user_ids: []})
 end
end
