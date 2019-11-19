class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.text :name
      t.text :row
      t.integer :column

      t.timestamps
    end
  end
end
