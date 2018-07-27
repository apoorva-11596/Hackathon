class Addnewcolumnstohotel < ActiveRecord::Migration
  def change
  	add_column :hotels, :imageurl, :string
  	add_column :hotels, :description, :string
  	remove_column :hotels, :distance
  end
end
