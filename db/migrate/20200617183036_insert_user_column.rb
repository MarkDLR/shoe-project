class InsertUserColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :shoes, :user_id, :integer
  end
end
