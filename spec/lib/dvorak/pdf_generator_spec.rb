require 'spec_helper'
require 'dvorak/pdf_generator'
require 'dvorak/cli'
require 'pdf/reader'

module Dvorak
  describe 'PDFGenerator' do
    before do
      Dvorak::CLI.source_root(File.expand_path('../../../../templates', __FILE__))
      FileUtils.rm_r('test_game') if Dir.exist?('test_game')
      @generator = PDFGenerator.new
    end

    describe '#generate' do
      context 'cards directory is not present' do
        before do
          Dir.stub(:exist?).with('cards') { false }
        end

        it 'sets results to an error message' do
          begin
            @generator.generate
          rescue SystemExit
          end
          expect(@generator.result).to eq 'Directory `cards` does not exist. Please use `dvorak new GAME_NAME` to create a new project.'
        end

        it 'exits with non-zero status' do
          expect{
            @generator.generate
          }.to raise_error SystemExit
        end
      end

      context 'game already created' do
        before do
          cli = Dvorak::CLI.new
          cli.new('test_game')
          Dir.chdir('test_game')
        end

        after do
          Dir.chdir('..')
        end

        context 'cards directory is present' do
          it 'sets result to a success message' do
            @generator.generate
            expect(@generator.result).to eq 'Success!'
          end
        end

        context 'output directory does not already exist' do
          it 'creates an output directory' do
            @generator.generate
            expect(File.exist?('output')).to be_true
          end
        end

        context 'output directory already exists' do
          it 'can run generate multiple times without complaint' do
            @generator.generate
            @generator.generate
          end
        end

        it 'creates a pdf file of the cards' do
          @generator.generate
          expect(File.exist?('output/cards.pdf')).to be_true
        end

        it 'creates a PDF with a page for each card in the deck' do
          @generator.generate
          reader = PDF::Reader.new("output/cards.pdf")

          expect(reader.pages.map(&:text)).to match_array [
            'Quick-drying Cement',
            'Brain Implant',
            'Zombie Attack!',
            'Anvil'
          ]
        end
      end
    end
  end
end
