class CreateReplays < ActiveRecord::Migration
  def self.up
    create_table :replays do |t|
      t.string :title
      t.integer :map_id
      t.integer :game_type
      t.datetime :game_played_at
      t.string :uploader
      t.string :replay
      t.boolean :winning_team

      t.timestamps
    end
  end

  def self.down
    drop_table :replays
  end
end
