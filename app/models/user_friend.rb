class UserFriend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :find_friends, -> (current_user) { 
    where(friend: current_user, status: 1)
  }

  def can_accept_request?(user)
    status == 0
  end

  
end
