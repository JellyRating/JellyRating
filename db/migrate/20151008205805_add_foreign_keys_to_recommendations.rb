class AddForeignKeysToRecommendations < ActiveRecord::Migration
  def change
    add_foreign_key :recommendations, :users, column: :created_by_id
    add_foreign_key :recommendations, :media, column: :media1_id
    add_foreign_key :recommendations, :media, column: :media2_id
  end
end
