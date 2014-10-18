class AgregarLegisladoresYComisiones < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :nombre
    end

    create_table :legisladores do |t|
      t.string  :nombre
      t.integer :cuerpo
      t.integer :partido
    end

    create_table :comisiones  do |t|
      t.string :nombre
      t.integer :cuerpo
    end

    create_table :comisiones_integrantes do |t|
      t.belongs_to :legislador
      t.belongs_to :comision
      t.string :puesto
    end

  end
end
