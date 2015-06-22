# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    model :store
    def index
      params._year ||= Time.now.year
      # Add code for when the index view is loaded
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    def current_game
      store.games.find(year: params._year.to_i).first
    end

    def current_todo
      _todos[(params._index || 0).to_i]
    end
    def add_todo
      _todos << { name: page._new_todo, number: rand(10) }
      page._new_todo = ''
    end
    def check_all
      _todos.each { |todo| todo._completed = true }
    end
    def completed
      _todos.count { |t| t._completed }
    end
    def total
      _todos.size
    end
    def incomplete
      # because .size and completed both return promises, we need to
      # call .then on them to get their value.
      _todos.size.then do |size|
        completed.then do |completed|
          size - completed
        end
      end
    end

    def percent_complete
      completed.then do |completed|
        total.zero? ? 0 : (100.0 * completed / total).round
      end
    end

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
