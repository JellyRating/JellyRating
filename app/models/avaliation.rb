class Avaliation < ActiveRecord::Base
	belongs_to :user 
	belongs_to :rateable, :polymorphic => true
	validates :rating, presence: true 
	validates :user_id, :uniqueness => { :scope => [:rateable_type, :rateable_id] }
end
