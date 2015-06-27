class Post < Volt::Model
  belongs_to :game
  belongs_to :player
  belongs_to :team
  belongs_to :week
  belongs_to :matchup

  field :total, Numeric
  field :counted
  field :time
  
end