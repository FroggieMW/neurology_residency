class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.integer :residency_program_id
      t.integer :interviewee_id
      t.date :interview_date

      t.timestamps
    end
  end
end
