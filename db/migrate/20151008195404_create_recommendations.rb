class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :item1
      t.references :item2
      t.references :created_by
      t.timestamps null: false
    end
  end
end
