class Changedatatypeofrating < ActiveRecord::Migration
  def change
  	change_column :hotels, :rating, :float
  end
end
