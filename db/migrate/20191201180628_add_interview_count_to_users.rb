class AddInterviewCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interviews_count, :integer
  end
end
