class ParliamentSession < ActiveRecord::Base
  has_many :topics

  CHAMBERS = { diputados: 'D', senadores: 'S', asamblea_general: 'A' }

  scope :of_diputados, -> { where(chamber: CHAMBERS[:diputados]) }
  scope :of_senadores, -> { where(chamber: CHAMBERS[:senadores]) }
  scope :of_asamblea_general, -> { where(chamber: CHAMBERS[:asamblea_general]) }

  def self.load_seeds
    # asamblea general
    create_session_with_topics('A', '20141110')
    create_session_with_topics('A', '20141102')
    create_session_with_topics('A', '20141020')
    create_session_with_topics('A', '20141016')

    # diputados
    create_session_with_topics('D', '20141108')
    create_session_with_topics('D', '20141101')
    create_session_with_topics('D', '20141020')
    create_session_with_topics('D', '20141016')

    # senadores
    create_session_with_topics('S', '20141110')
    create_session_with_topics('S', '20141102')
    create_session_with_topics('S', '20141012')
    create_session_with_topics('S', '20141025')
  end

  def self.create_session_with_topics(chamber, date)
    session_1 = ParliamentSession.create(chamber: chamber, date: date)
    (1..4).each{ |i| session_1.topics.create(name: "Tema del día #{i}") }
  end
end