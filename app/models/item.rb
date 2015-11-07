class Item < ActiveRecord::Base
  before_save :capitalize_title
  validates :title, presence: true;
  validates :release_date, presence: true;

  has_many :avaliations, :as => :rateable
  has_many :commentaries, :as => :commentable
  has_many :recommendations1, class_name: "Recommendation", foreign_key: "item1_id"
  has_many :recommendations2, class_name: "Recommendation", foreign_key: "item2_id"
  has_many :users, :through => :avaliations

  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end
end
