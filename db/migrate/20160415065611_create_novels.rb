class CreateNovels < ActiveRecord::Migration[5.0]
  def change
    create_table :novels do |t|
      t.string :title, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :novels, :title
  end
end
