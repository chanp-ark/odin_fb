class UserFriendsController < ApplicationController

  def index
    @user_friends = UserFriend.find_friends(current_user)
    @friend_requests = UserFriend.where(friend: current_user, status: 0)
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
      current_user.user_friends.create(friend_id: user_friend.user_id, status: 1)
    else
      flash[:alert] = "There was something wrong accepting the friend request"
    end
    redirect_to user_friends_path
  end

  def destroy
    user_friend = UserFriend.find(params[:id])
    other_record = UserFriend.where(user: current_user, friend: user_friend.user).first
    if user_friend.destroy && other_record.destroy
      flash[:notice] = "You are too cool anyway"
    else
      flash[:alert] = "There was something wrong rejecting the friend request"
    end
    redirect_to user_friends_path
  end
end
