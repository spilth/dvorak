require File.dirname(__FILE__) + '/../../lib/dvorak'
require 'fileutils'
require 'pdf/reader'
require 'pry'

Given(/^I create a new deck named "(.*?)"$/) do |deck_name|
  @deck_name = deck_name
  Dvorak::CLI.source_root(File.expand_path('../../../templates', __FILE__))
  FileUtils.rm_r(@deck_name) if Dir.exist?(@deck_name)
  @cli = Dvorak::CLI.new
  @cli.new(@deck_name)
end

When(/^I list the directories in my project$/) do
  @files = Dir.glob("#{@deck_name}/**/*")
end

When(/^I generate the deck$/) do
  Dir.chdir(@deck_name)
  @cli.generate
  Dir.chdir("..")
end

Then(/^I should see the directory "(.*?)"$/) do |directory|
  expect(@files).to include("#{@deck_name}/#{directory}")
end

Then(/^I should see the file "(.*?)"$/) do |file|
  expect(@files).to include("#{@deck_name}/#{file}")
end

Then(/^the PDF should have (\d+) pages$/) do |count|
  reader = PDF::Reader.new("#{@deck_name}/output/cards.pdf")
  expect(reader.page_count.to_s).to eq count
end
