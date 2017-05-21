class AddForeignKeyToExcuses < ActiveRecord::Migration[5.0]
  def change
    add_column :excuses, :user_id, :integer
  end
end
