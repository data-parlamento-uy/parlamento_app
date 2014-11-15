class AddComissionTypeToCommisions < ActiveRecord::Migration
  def change
    add_column :comissions, :comission_type, :string
  end
end
