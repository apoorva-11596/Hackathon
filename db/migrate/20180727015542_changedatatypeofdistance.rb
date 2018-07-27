class Changedatatypeofdistance < ActiveRecord::Migration
  def change
  	change_column :hotels, :distance, :float
  end
end
