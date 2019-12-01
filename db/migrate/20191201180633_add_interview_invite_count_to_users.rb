class AddInterviewInviteCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interview_invites_count, :integer
  end
end
