class RosterManager < Volt::Task
  def signup # sign up all the new players
    ThreadParser.signup(url).each do |post|
      # create user if necessary
      # create players attached to that user
    end
  end
  def weekly
    ThreadParser.weekly(url).each do |post|
      # create scores for week
    end
  end
end