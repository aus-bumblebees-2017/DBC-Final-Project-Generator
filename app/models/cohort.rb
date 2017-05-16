class Cohort < ApplicationRecord
  has_many :students
  has_many :pitches, through: :students

	validates :name, presence: true
	validates_uniqueness_of :name
	validates :pitch_limit, presence: true
	validates :vote_limit, presence: true
	validates :pitch_start, presence: true
	validates :vote_start, presence: true
	validates :vote_end, presence: true

  def self.active
    Cohort.all.select do |c|
      c.active == true
    end
  end

  def current_pitches
    self.pitches.select do |p|
      p.round_id == self.stage_id
    end
  end
end
