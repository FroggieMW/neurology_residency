class AddInterviewInviteCountToResidencyPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :residency_programs, :interview_invites_count, :integer
  end
end
