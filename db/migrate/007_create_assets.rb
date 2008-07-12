class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :project_id
      t.string :filename
      t.string :thumbnail
      t.string :caption

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
