require 'rails_helper'

describe MessagesController do

  let(:user) {create(:user)}
  let(:group) {create(:group)}

  before do
    sign_in user
  end

  describe 'GET #index' do

    it "assigns the requested contact to @message" do
      get :index, params: {group_id: group.id}
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact to @group" do
      @group = Group.find(group.id)
      get :index, params: {group_id: group.id}
      expect(assigns(:group)).to eq @group
    end

    it "renders the :index template" do
      get :index, params: {group_id: group.id}
      expect(response).to render_template :index
    end
  end

  describe "POST#create" do
    let(:message) {build(:message)}

   context "When body is present" do
    it "save message" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirect to index" do
      post :create, group_id: group.id, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path
    end
   end

   context "When there is no body." do
    it "not save message" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message, body: nil)
      }.not_to change(Message, :count)
    end

    it "redirect to index" do
      post :create, group_id: group.id, message: attributes_for(:message, body: nil)
      expect(response).to redirect_to group_messages_path
    end
   end
 end
end
