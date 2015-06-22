class Week < Volt::Model
  belongs_to :game
  has_many :scores
  has_many :matchups

  field :number, Numeric
  field :url

end
