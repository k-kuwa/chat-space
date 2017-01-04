require 'rails_helper'

describe MessagesController do

  describe 'GET #index' do
    let!(:user){create(:user)}
    let!(:group){create(:group)}

    before do
      sign_in user
    end

    it "assigns the requested contact to @message" do
      get :index,params: {group_id: group.id}
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact to @group" do
      @group = Group.find(group.id)
      get :index,params: {group_id: group.id}
      expect(assigns(:group)).to eq @group
    end

    it "renders the :index template" do
      get :index,params: {group_id: group.id}
      expect(response).to render_template :index
    end
  end
end
