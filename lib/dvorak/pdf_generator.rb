module Dvorak
  class PDFGenerator
    attr_reader :result

    def generate
      if Dir.exist?('cards')
        FileUtils.mkdir_p("output")
        FileUtils.touch("output/cards.pdf")

        # File.open("output/cards.pdf", "w") do |f|
          # f.write("yolokitten")
        # end

        @result = 'Success!'
      else
        @result = 'Directory `cards` does not exist. Please use `dvorak new GAME_NAME` to create a new project.'
        exit 1
      end
    end
  end
end
