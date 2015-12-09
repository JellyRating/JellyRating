class Item < ActiveRecord::Base
  before_save :capitalize_title
  validates :title, presence: true;
  validates :release_date, presence: true;

  has_many :avaliations, :as => :rateable
  has_many :commentaries, :as => :commentable
  has_many :recommendations1, class_name: "Recommendation", foreign_key: "item1_id"
  has_many :recommendations2, class_name: "Recommendation", foreign_key: "item2_id"
  has_many :users, :through => :avaliations


  acts_as_taggable
  

  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end

  def like_count
    self.avaliations.where("avaliations.rating = ?", true).size
  end

  def dislike_count
    self.avaliations.where("avaliations.rating = ?", false).size
  end

  def like_ratio
    100 * like_count / ((like_count + dislike_count) == 0 ? 1 : (like_count + dislike_count))
  end

  def self.recent
    order('created_at desc')
  end

  def self.top_rated
    all.sort{|a,b| b.like_ratio <=> a.like_ratio}
  end
end
