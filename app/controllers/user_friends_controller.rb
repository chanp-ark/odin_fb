class UserFriendsController < ApplicationController
  def create
    friend = User.find(params[:id])
  end
end
