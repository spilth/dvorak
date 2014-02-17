require 'spec_helper'
require 'dvorak/cli'

module Dvorak
  describe 'CLI' do
    describe 'new' do
      it 'creates a directory with the same name as the game' do
        cli = Dvorak::CLI.new
        expect(cli).to receive(:directory).with(:game, 'mad_world')
        cli.new('mad_world')
      end
    end

    describe 'generate' do
      it 'does not actually do anything yet' do
        cli = Dvorak::CLI.new
        output = cli.generate
        expect(output).to eq("This does not work yet.")
      end
    end
  end
end
