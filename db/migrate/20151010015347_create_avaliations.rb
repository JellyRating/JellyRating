class CreateAvaliations < ActiveRecord::Migration
  def change
    create_table :avaliations do |t|
      t.references :rateable, polymorphic: true, index: true
      t.references :user
      t.boolean :rating

      t.timestamps null: false
    end

  end


end
