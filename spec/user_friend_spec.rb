require 'rails_helper'
require './app/models/user_friend.rb'

# scope :find_friends, -> (current_user) { 
#     where(friend: current_user, status: 1)
#   }

describe UserFriend do
  describe "#can_accept_request?" do
    it "returns true when status is 0" do
      user = UserFriend.new(status: 0)
      expect(user.status).to eql(0)
    end

    it "returns false when status is 1" do
      user = UserFriend.new(status: 1)
      expect(user.status).to eql(1)
    end
  end

  describe ".find_friends" do
    it "returns friend of current user" do
      current_user = User.new(name: "test", email: "test@gmail.com", password: "password")
      another_user = User.new(name: "another_user", email: "another_user@gmail.com", password: "password")
      current_user.save
      another_user.save
      UserFriend.create!(friend: current_user, user: another_user, status: 1)
      expect(UserFriend.find_friends(current_user).first.user_id).to eql(another_user.id)
    end
  end
end