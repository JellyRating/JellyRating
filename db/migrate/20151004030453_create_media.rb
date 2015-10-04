class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
        t.string "title";
        t.datetime "release_date";
        t.timestamps null: false
    end
  end
end
