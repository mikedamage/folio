class ProjectCachedTagColumn < ActiveRecord::Migration
  def self.up
		add_column :projects, :cached_tag_list, :string
  end

  def self.down
		remove_column :projects, :cached_tag_list
  end
end
