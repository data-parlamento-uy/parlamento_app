class PoliticalParty < ActiveRecord::Base
  has_many :legislators

  def self.load_seeds
    PoliticalParty.create({name: "partido nacional"})
    PoliticalParty.create({name: "partido colorado"})
    PoliticalParty.create({name: "partido frente amplio"})
    PoliticalParty.create({name: "partido independiente"})
  end

  def senadores_count
    legislators.in_senadores.count
  end

  def diputados_count
    legislators.in_diputados.count
  end
end