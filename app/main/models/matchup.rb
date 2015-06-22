class Matchup < Volt::Model
  belongs_to :game
  belongs_to :week
  has_many :scores
end
