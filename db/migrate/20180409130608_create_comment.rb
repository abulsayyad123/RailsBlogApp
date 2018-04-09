class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.integer :post_id
    	t.text :comment_text
    	
    end
  end
end
