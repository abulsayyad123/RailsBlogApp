class CreatePhone < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
    	t.integer  "contact_id"
	    t.string   "phone"
	    t.string   "phone_type"
	    t.timestamps
    end
  end
end
