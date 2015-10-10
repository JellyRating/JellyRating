class Recommendation < ActiveRecord::Base
  belongs_to :media1, class_name: "Media"
  belongs_to :media2, class_name: "Media"
  belongs_to :created_by, class_name: "User"
  has_many :avaliations, :as => :rateable

  validate :different_media?
  private
    def different_media?
       errors.add(:media1, "must be different from the other media") unless media1 != media2
    end 
end
