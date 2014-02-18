module Dvorak
  class PDFGenerator
    attr_reader :result

    def generate
      if Dir.exist?('cards')
        Dir.mkdir("output")
        @result = 'Success!'
      else
        @result = 'Directory `game` does not exist. Please us `dvorak new GAME_NAME` to create a new project.'
        exit 1
      end
    end
  end
end
