class Pitch < ApplicationRecord
  validate :name
  validate :description
  validate :student_id
  validate :validate_pitches


  def validate_pitches
      s=Student.find(self.student_id)
      pl=s.cohort.pitch_limit
      if s.pitches.count > (pl - 1)
        errors.add(:pitches,"pitch limit(#{pl}) exceeded for #{s.full_name}")
      end
  end


  belongs_to :student
  has_one :cohort, through: :student
  validates_associated :cohort
  # belongs_to :cohort, foreign_key: :student_id
  has_many :votes
  belongs_to :team, optional: true

  def round_votes(round, vote_level)
    votes = self.votes.select do |vote|
      vote.round_id == round && vote.vote == vote_level
    end
    votes.count
  end
end
