class AddForeignKeysToRecommendations < ActiveRecord::Migration
  def change
    add_foreign_key :recommendations, :users, column: :created_by_id
    add_foreign_key :recommendations, :item, column: :item1_id
    add_foreign_key :recommendations, :item, column: :item2_id
  end
end
