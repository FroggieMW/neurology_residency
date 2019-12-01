class CreateResidencyPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :residency_programs do |t|
      t.string :state
      t.string :program_name

      t.timestamps
    end
  end
end
