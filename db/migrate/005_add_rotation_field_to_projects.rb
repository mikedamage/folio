class AddRotationFieldToProjects < ActiveRecord::Migration
  def self.up
		add_column :projects, :in_rotation, :boolean, :default => 1
  end

  def self.down
		remove_column :projects, :in_rotation
  end
end
