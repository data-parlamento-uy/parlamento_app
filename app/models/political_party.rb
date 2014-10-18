class PoliticalParty < ActiveRecord::Base

  def self.load_seeds
    PoliticalParty.create({name: "partido nacional"})
    PoliticalParty.create({name: "partido colorado"})
    PoliticalParty.create({name: "partido frente amplio"})
    PoliticalParty.create({name: "partido independiente"})
  end
end