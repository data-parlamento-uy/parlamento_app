class ComissionParticipant < ActiveRecord::Base
  belongs_to :legislator
  belongs_to :comission
end