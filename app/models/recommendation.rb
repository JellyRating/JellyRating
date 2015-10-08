class Recommendation < ActiveRecord::Base
  belongs_to :media1, class_name: "Media"
  belongs_to :media2, class_name: "Media"
  belongs_to :created_by, class_name: "User"
end
