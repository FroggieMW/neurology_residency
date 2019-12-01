class User < ApplicationRecord
  # Direct associations

  has_many   :interview_invites,
             :foreign_key => "invitee_id"

  has_many   :interviews,
             :foreign_key => "interviewee_id"

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
