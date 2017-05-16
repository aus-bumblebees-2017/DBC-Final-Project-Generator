class AddPitchIdToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :pitch_id, :integer
  end
end
