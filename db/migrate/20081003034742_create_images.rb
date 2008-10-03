class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
			t.string :name
			t.string :caption
			t.integer :project_id
      t.binary :image_file_data

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
