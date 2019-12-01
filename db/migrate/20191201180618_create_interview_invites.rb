class CreateInterviewInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :interview_invites do |t|
      t.integer :residency_program_id
      t.date :invite_received_date
      t.integer :invitee_id

      t.timestamps
    end
  end
end
