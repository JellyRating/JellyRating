class CreateMedias < ActiveRecord::Migration
  def up
    create_table "medias" do |t|
        t.string "title";
        t.datetime "release_date";
        t.timestamps
    end
  end

  def down
    drop_table "medias";
  end
end
