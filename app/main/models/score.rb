class Score < Volt::Model
  belongs_to :team
  belongs_to :week
  belongs_to :matchup

  field :win
  field :loss

end
