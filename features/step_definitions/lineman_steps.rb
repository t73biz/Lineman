Given /^I am not yet running lineman$/ do
end

When /^I start a new instance of lineman$/ do
  @messenger = StringIO.new
  lineman = Lineman::Core.new(@messenger)
  lineman.start
end

Then /^I should see "([^\"]*)"$/ do |message|
  @messenger.string.split("\n" ).should include(message)
end
