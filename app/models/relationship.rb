class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User" 
	belongs_to :followed, class_name: "User"


  def self.followed_avaliations
    Avaliation.joins(:user).where(users: {id: :followed})
  end

end