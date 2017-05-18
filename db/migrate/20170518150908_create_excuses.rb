class CreateExcuses < ActiveRecord::Migration[5.0]
  def change
    create_table :excuses do |t|
      t.string :content
      t.integer :count

      t.timestamps
    end
  end
end
