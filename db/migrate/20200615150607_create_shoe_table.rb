class CreateShoeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |table|
      table.string(:shoe_name)
      table.string(:shoe_color)
      table.integer(:size)
      table.integer(:price)
      table.integer(:brand_id)
      table.integer(:store_id)
    end
  end
end
