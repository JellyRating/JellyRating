class CreateMediaAvaliations < ActiveRecord::Migration
  def change
    create_table :media_avaliations do |t|
      t.references :media
      t.references :user
      t.boolean :rating

      t.timestamps null: false
    end
  end
end
