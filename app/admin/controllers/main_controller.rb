module Admin
  class MainController < Volt::ModelController
    model :store
    def index
      # Add code for when the index view is loaded
      params._year ||= Time.now.year
    end

    def edit
      # something
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    def add_game
      store.games << {year: page._new_game_year, current_week: page._new_game_current_week }
      page._new_game_year = ''
      page._new_game_current_week = ''
    end

    def current_game
      store.games.where(year: params._year.to_i).first
    end

    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end