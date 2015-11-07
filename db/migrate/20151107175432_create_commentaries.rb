class CreateCommentaries < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|
      t.references :commentable, polymorphic: true, index: true
      t.references :user
      t.text :comment
      t.timestamps null: false
    end
  end
end
