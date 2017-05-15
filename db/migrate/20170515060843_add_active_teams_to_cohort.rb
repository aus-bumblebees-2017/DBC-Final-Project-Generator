class AddActiveTeamsToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :teams, :boolean, default: false
  end
end
