class Legislator < ActiveRecord::Base
  CHAMBERS = { diputados: 'D', senadores: 'S' }

  has_many :comission_participants
  has_many :comissions, through: :comission_participants

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

  def expertise
    all_topics = comissions.map(&:categories).flatten

    topics_temp = all_topics.reject{|topic| topic == 'otros' }
    topics_count = topics_temp.
        each_with_object(Hash.new(0)) { |topic,counts| counts[topic] += 1 }.
        sort_by{|topic, value| -value }

    topics = topics_count.map{|topic, _| topic }
    if topics.size >= 4
      topics[0..3]
    else
      topics += ['otros'] if all_topics.include?('otros')
      topics
    end
  end

  def attendance
    attendances_count * 100 / citations_count
  end

  def self.search_by_name(query)
    Legislator.where("first_name like :query OR last_name like :query", query: "%#{query}%")
  end
end
