class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :vote
      # t.references :pitch, foreign_key: true
      # t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
