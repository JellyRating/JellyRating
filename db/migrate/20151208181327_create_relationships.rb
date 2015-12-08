class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.references :follower_id
    	t.references :followed_id
    	t.timestamps null: false    	
    end

    add_foreign_key :relationships, :user, column: :follower_id
    add_foreign_key :relationships, :user, column: :followed_id
    

  end
end
