class AddListIdToEntries < ActiveRecord::Migration[5.1]
  def change
      add_column :entries, :list_id, :integer
  end
end
