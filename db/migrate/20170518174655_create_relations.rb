class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.references :occasion, foreign_key: true
      t.references :excuse, foreign_key: true

      t.timestamps
    end
  end
end
