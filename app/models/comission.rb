class Comission < ActiveRecord::Base
  has_many :comission_participants
  has_many :legislators, through: :comission_participants
end