class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.string :account
      t.integer :match_id
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
