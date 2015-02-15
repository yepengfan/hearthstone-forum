class AddDefaultValueToMatch < ActiveRecord::Migration
  def up
    change_column :matches, :lock_version, :integer, :default => 0
  end

  def down
    change_column :matches, :lock_version, :integer, :default => nil
  end
end
