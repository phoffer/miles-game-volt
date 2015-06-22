class Game < Volt::Model
  has_many :teams
  has_many :weeks
  has_many :matchups

  field :current_week, Numeric
  field :archived
  field :status
  field :url
  field :year

  def percent_complete
    (100.0 * current_week / 52).round
  end
  
end