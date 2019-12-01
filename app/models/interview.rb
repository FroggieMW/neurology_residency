class Interview < ApplicationRecord
  # Direct associations

  belongs_to :residency_program,
             :counter_cache => true

  belongs_to :interviewee,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
