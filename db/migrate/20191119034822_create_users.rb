class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.boolean :admin, :default => false;

      t.timestamps
    end
  end
end
