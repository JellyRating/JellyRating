class Avaliation < ActiveRecord::Base
	belongs_to :user 
	belongs_to :rateable, :polymorphic => true
	validates_inclusion_of :rating, in: [true, false]
	validates :user_id, :uniqueness => { :scope => [:rateable_type, :rateable_id] }

	#scopes
  def self.last_avaliations
    order('updated_at desc')
  end

	def rating2string
		str = "#{self.rating ? 'Liked' : 'Disliked'}"					
	end	
end
