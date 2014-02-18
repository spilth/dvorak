require File.dirname(__FILE__) + '/../../lib/dvorak'

Given(/^I create a new deck named "(.*?)"$/) do |deck_name|
  @deck_name = deck_name
  Dvorak::CLI.source_root(File.expand_path('../../../templates', __FILE__))
  @cli = Dvorak::CLI.new
  @cli.new(@deck_name)
end

When(/^I list the directories in my project$/) do
  @files = Dir.glob("#{@deck_name}/**/*")
end

Then(/^I should see the directory "(.*?)"$/) do |directory|
  expect(@files).to include("#{@deck_name}/#{directory}")
end

Then(/^I should see the file "(.*?)"$/) do |file|
  expect(@files).to include("#{@deck_name}/#{file}")
end
