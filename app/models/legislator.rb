class Legislator < ActiveRecord::Base
  CHAMBERS = { diputados: 'D', senadores: 'S' }

  belongs_to :political_party

  scope :in_diputados, -> { where(chamber: CHAMBERS[:diputados]) }
  scope :in_senadores, -> { where(chamber: CHAMBERS[:senadores]) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def chamber_and_state_info
    if chamber == CHAMBERS[:diputados]
      "Diputado por #{state}"
    else
      "Senador"
    end
  end
end
