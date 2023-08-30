class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
　　　
　　　t.integer :post_id
　　　t.integer :user_id
      t.timestamps 
      t.datetime :remember_created_at
    end
  end
end
