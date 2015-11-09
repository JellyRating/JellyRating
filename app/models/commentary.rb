class Commentary < ActiveRecord::Base
  belongs_to :user 
  belongs_to :commentable, :polymorphic => true

  #scopes
  def self.last_commentaries
    order('created_at desc')
  end
end
