class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :media1
      t.references :media2
      t.references :created_by
      t.timestamps null: false
    end
  end
end
