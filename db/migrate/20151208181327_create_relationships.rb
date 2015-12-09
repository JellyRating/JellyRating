class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.references :follower
    	t.references :followed
    	t.timestamps null: false    	
    end

    add_foreign_key :relationships, :user, column: :follower
    add_foreign_key :relationships, :user, column: :followed
    

  end
end
