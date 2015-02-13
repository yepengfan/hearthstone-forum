class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name
      t.datetime :time
      t.text :rules
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
