require 'rails_helper'

describe MessagesController do

  describe 'GET #index' do
    let!(:user){create(:user)}
    let!(:group){create(:group)}
    let!(:message){create(:message)}

    before do
      sign_in user
    end

    it "assigns the requested contact to @message" do
      get :index, params: {group_id: group.id}
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact to @group" do
      @group = Group.find(group.id)
      get :index, params: {group_id: group.id}
      expect(assigns(:group)).to eq @group
    end

    it "assigns the requested contact to @user" do
      @user = User.find(user.id)
      get :index, params: {group_id: group.id}
      expect(assigns(:user)).to eq @user
    end

    it "assigns the requested contact to @group_messages" do
      @group = Group.find(group.id)
      @group_messages = @group.messages
      get :index, params: {group_id: group.id}
      expect(assigns(:group_messages)).to eq @group_messages
    end

    it"assigns the requested contact to @user_groups" do
      @user = User.find(user.id)
      @group = Group.find(group.id)
      @user_groups = @user.groups
      get :index, params: {group_id: group.id}
      expect(assigns(:user_groups)).to eq @user_groups
    end

    it"assigns the requested contact to @group_users" do
      @user = User.find(user.id)
      @group = Group.find(group.id)
      @group_users = @group.users
      get :index, params: {group_id: group.id}
      expect(assigns(:group_users)).to eq @group_users
    end

    it "renders the :index template" do
      get :index, params: { group_id: group.id}
      expect(response).to render_template :index
    end
  end
end

