class AddLegislatorsExtraInfo < ActiveRecord::Migration
  def change
    add_column :legislators, :citations_count, :integer
    add_column :legislators, :attendances_count, :integer
  end
end
