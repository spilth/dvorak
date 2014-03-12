require 'prawn'
require 'yaml'

module Dvorak
  class PDFGenerator
    attr_reader :result

    def generate
      if Dir.exist?('cards')
        FileUtils.mkdir_p("output")

        actions = YAML.load_file('cards/actions.yml')
        things = YAML.load_file('cards/things.yml')

        on_first_page = true
        Prawn::Document.generate('output/cards.pdf') do
          (things+actions).each do |action|
            start_new_page unless on_first_page
            text_box action['title']
            on_first_page = false
          end
        end

        @result = 'Success!'
      else
        @result = 'Directory `cards` does not exist. Please use `dvorak new GAME_NAME` to create a new project.'
        exit 1
      end
    end
  end
end
