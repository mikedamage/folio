class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :category_id
      t.date :date
      t.string :client
      t.string :url
      t.string :custom_values
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
