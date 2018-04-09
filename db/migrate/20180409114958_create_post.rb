class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :post_body
      t.string :image_url
      t.time :reading_time
    end
  end
end
