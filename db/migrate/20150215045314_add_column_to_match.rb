class AddColumnToMatch < ActiveRecord::Migration
  def up
    add_column :matches, :status, :boolean, :default => false
  end

  def down
    remove_column :matches, :status
  end
end
