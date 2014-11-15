class AddSessionsAndTopics < ActiveRecord::Migration
  def change
    create_table :parliament_sessions do |t|
      t.string  :chamber
      t.date :date
    end

    create_table :topics do |t|
      t.string  :name
      t.integer :parliament_session_id
    end
  end
end
