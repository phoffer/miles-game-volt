class Player < Volt::Model
  belongs_to :user
  belongs_to :team
  has_many :posts

  field :goal,        Numeric
  field :preference

end