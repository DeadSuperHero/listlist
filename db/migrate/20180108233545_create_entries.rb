class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.boolean :completed

      t.timestamps
    end
  end
end
