module Dvorak
  class PDFGenerator
    attr_reader :result

    def generate
      if Dir.exist?('cards')
        Dir.mkdir("output")
        @result = 'Success!'
      else
        @result = 'Directory `cards` does not exist. Please use `dvorak new GAME_NAME` to create a new project.'
        exit 1
      end
    end
  end
end
