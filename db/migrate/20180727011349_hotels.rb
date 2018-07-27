class Hotels < ActiveRecord::Migration
  def change
  	create_table :hotels do |t|
      t.string   :name, null: false
      t.string   :address, null: false
      t.string   :location, null: false
   	  t.integer  :price, null: false
   	  t.integer  :rating, null: false	
   	  t.integer  :distance, null: false
	  t.timestamps null: false
    end
  end
end
