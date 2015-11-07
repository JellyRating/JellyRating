class Recommendation < ActiveRecord::Base
  belongs_to :item1, class_name: "Item"
  belongs_to :item2, class_name: "Item"
  belongs_to :created_by, class_name: "User"
  has_many :avaliations, :as => :rateable

  validate :different_item?
  private
    def different_item?
       errors.add(:item1, "must be different from the other item") unless item1 != item2
    end 
end
