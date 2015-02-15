class AddDefaultValueToEnrolment < ActiveRecord::Migration
  def up
    change_column :enrolments, :lock_version, :integer, :default => 0
  end

  def down
    change_column :enrolments, :lock_version, :integer, :default => nil
  end
end
