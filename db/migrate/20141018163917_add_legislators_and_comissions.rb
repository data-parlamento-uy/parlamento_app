class AddLegislatorsAndComissions < ActiveRecord::Migration
  def change
    create_table :political_parties do |t|
      t.string :name
    end

    create_table :legislators do |t|
      t.string  :first_name
      t.string :last_name
      t.integer :political_party_id
      t.string :chamber
    end

    create_table :comissions  do |t|
      t.string :name
      t.string :chamber
    end

    create_table :comission_participants do |t|
      t.belongs_to :comission
      t.belongs_to :legislator
      t.string :extra_info
    end

  end
end
