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
  end
end
