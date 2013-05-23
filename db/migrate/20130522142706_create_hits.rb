class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :site_token
      t.integer :badge, default: 0
      t.integer :contextual, default: 0

      t.timestamps
    end

    add_index :hits, :site_token, unique: true
  end
end
