class Legislator < ActiveRecord::Base

  belongs_to :political_party

  def full_name
    "#{last_name}"
  end
end