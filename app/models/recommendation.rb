class Recommendation < ActiveRecord::Base
  belongs_to :item1, class_name: "Item"
  belongs_to :item2, class_name: "Item"
  belongs_to :created_by, class_name: "User"
  has_many :avaliations, :as => :rateable
  has_many :commentaries, :as => :commentable
  validate :different_item?

  def title
    return "#{item1.title} <-> #{item2.title}"
  end

  def like_count
    self.avaliations.where("avaliations.rating = ?", true).size
  end

  def dislike_count
    self.avaliations.where("avaliations.rating = ?", false).size
  end

  #scopes
  def self.last_recommendations
    order('created_at desc')
  end

  def self.top_rated
    all.sort{|a,b| b.like_count <=> a.like_count}
  end  

  private
    def different_item?
       errors.add(:item1, "must be different from the other item") unless item1 != item2
    end 
end
