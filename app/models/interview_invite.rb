class InterviewInvite < ApplicationRecord
  # Direct associations

  belongs_to :residency_program,
             :counter_cache => true

  belongs_to :author,
             :class_name => "User",
             :foreign_key => "invitee_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
