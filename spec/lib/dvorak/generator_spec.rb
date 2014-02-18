require 'spec_helper'
require 'dvorak/generator'

module Dvorak
  describe 'Generator' do
    before do
      @generator = Generator.new
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
          expect(@generator.result).to eq 'Directory `game` does not exist. Please us `dvorak new GAME_NAME` to create a new project.'
        end

        it 'exits with non-zero status' do
          expect{
            @generator.generate
          }.to raise_error SystemExit
        end
      end

      context 'cards directory is present' do
        before do
          Dir.stub(:exist?).with('cards') { true }
        end

        it 'sets result to a succes message' do
          @generator.generate
          expect(@generator.result).to eq 'Success!'
        end
      end

    end
  end
end