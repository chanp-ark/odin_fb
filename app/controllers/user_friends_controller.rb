class UserFriendsController < ApplicationController

  def index
    @user_friends = UserFriend.find_friends(current_user)
    @friend_requests = UserFriend.where(friend: current_user)
  end

  def request_friend
    friend = User.find(params[:friend])
    friend_request = current_user.user_friends.build(friend_id: friend.id, status: 0)

    if friend_request.save
      flash[:notice] = "Friend Request Sent"
    else
      flash[:alert] = "There was something wrong with the request"
    end
    redirect_to users_path
  end

  def update
    user_friend = UserFriend.find(params[:id])
    # if status is edited to 1, save
    if user_friend.can_accept_request?(current_user) && user_friend.update(status: 1)
      flash[:notice] = "You are now officially friends!"
    else
      flash[:alert] = "There was something wrong accepting the friend request"
    end
    redirect_to user_friends_path
  end

  def destroy
    friend = UserFriend.find(params[:id])
    if friend.destroy
      flash[:notice] = "You are too cool anyway"
    else
      flash[:alert] = "There was something wrong rejecting the friend request"
    end
    redirect_to user_friends_path
  end
end
