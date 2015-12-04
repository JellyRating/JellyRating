class Commentary < ActiveRecord::Base
  belongs_to :user
  validates :comment, presence: true
  belongs_to :commentable, :polymorphic => true

  #scopes
  def self.recent
    order('created_at desc')
  end
end
