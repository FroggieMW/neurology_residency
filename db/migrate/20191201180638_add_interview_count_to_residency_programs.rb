class AddInterviewCountToResidencyPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :residency_programs, :interviews_count, :integer
  end
end
