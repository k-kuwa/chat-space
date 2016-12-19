class GroupsController < ApplicationController

 def new
  @group = Group.new
  @group.group_users.build
 end

 def create
  @group = Group.create(group_params)
 end

 private
 def group_params
  params.require(:group).permit(:name, {user_ids: []})
 end
end
