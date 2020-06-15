class CreateBrandTable < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |table|
      table.string(:brand_name)
    end
  end
end
