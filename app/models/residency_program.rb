class ResidencyProgram < ApplicationRecord
  # Direct associations

  has_many   :interview_invites,
             :dependent => :destroy

  has_many   :interviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
