class CreateStoreTable < ActiveRecord::Migration[5.2]
  
  def change 
    create_table :stores do |table|
      table.string(:store_name)
      table.string(:store_location)
    end
  end
  
end
