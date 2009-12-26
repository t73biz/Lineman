Given /^I am not yet running lineman$/ do
end

When /^I start a new instance of lineman$/ do
  @sender = StringIO.new
  lineman = Lineman::Core.new(@sender)
  lineman.start
end

Then /^I should see "([^\"]*)"$/ do |message|
  @sender.string.split("\n" ).should include(message)
end

Given /^I am running lineman$/ do
  @sender = StringIO.new
  @comm = Lineman::Utilities::CommHelper.new(@sender)
end

When /^I enter (.)$/ do |@input|
  @sender = StringIO.new
  @comm = Lineman::Utilities::CommHelper.new(@sender)
  @comm.receive(@input).should_not == "Danger Will Robinson!"
end

Then /^I should see (.*) Menu$/ do |menu|
  @sender = StringIO.new
  @comm = Lineman::Utilities::CommHelper.new(@sender)
  @comm.receive(@input)
  @sender.string.split("\n").should include(menu + " Menu")
end


