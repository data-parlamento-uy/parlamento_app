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

  def pretty_name
    case name
      when 'partido nacional'      then 'p.nacional'
      when 'partido colorado'      then 'p.colorado'
      when 'partido independiente' then 'p.independiente'
      when 'partido frente amplio' then 'frente amplio'
    end
  end

  def related_states
    legislators.in_diputados.map(&:state).uniq.sort
  end

  def attendance
    citations_count = legislators.map(&:citations_count).sum
    attendances_count = legislators.map(&:attendances_count).sum

    attendances_count * 100 / citations_count
  end

  def self.total_attendance
    citations_count = Legislator.all.map(&:citations_count).sum
    attendances_count = Legislator.all.map(&:attendances_count).sum

    attendances_count * 100 / citations_count
  end
end