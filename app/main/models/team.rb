class Team < Volt::Model
  belongs_to :game
  has_many :players
  has_many :weeks
  has_many :posts
  has_one :all_star_team

  field :bonus
end

class AllStarTeam < Team
  belongs_to :teams
end

class IndividualTeam < Team; end
