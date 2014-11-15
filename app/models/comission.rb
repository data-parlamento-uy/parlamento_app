class Comission < ActiveRecord::Base
  has_many :comission_participants
  has_many :legislators, through: :comission_participants

  CHAMBERS = { diputados: 'D', senadores: 'S', asamblea_general: 'A' }

  scope :of_diputados, -> { where(chamber: CHAMBERS[:diputados]) }
  scope :of_senadores, -> { where(chamber: CHAMBERS[:senadores]) }
  scope :of_asamblea_general, -> { where(chamber: CHAMBERS[:asamblea_general]) }
  scope :by_name, -> { order('name ASC') }

end