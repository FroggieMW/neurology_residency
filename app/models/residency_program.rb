class ResidencyProgram < ApplicationRecord
  # Direct associations

  has_many   :interviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
