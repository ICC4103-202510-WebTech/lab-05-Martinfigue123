class UsersController < ApplicationController
  def index
    @users = User.all
    @messages = Message.all
    @chats = Chat.all
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.find(params[:id])
    @chats = Chat.find(params[:id])
  end
end
