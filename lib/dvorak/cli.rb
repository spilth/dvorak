require 'thor'

module Dvorak
  class CLI < Thor
    include Thor::Actions

    desc 'new GAME_NAME', 'Sets up a project directory for your game.'
    def new(name)
      @name = Thor::Util.snake_case(name)
      directory(:game, @name)
    end

    desc 'generate', 'Turns your project into PDFs (not yet, though!)'
    def generate
      "This does not work yet."
    end
  end
end
