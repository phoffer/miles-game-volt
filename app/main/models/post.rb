class Post < Volt::Model
  belongs_to :player
  belongs_to :week
  belongs_to :game
  belongs_to :team
end