class AddChamberPresident < ActiveRecord::Migration
  def change
    add_column :legislators, :is_president, :boolean, default: false
  end
end
