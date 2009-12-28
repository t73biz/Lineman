Given /^I am running lineman$/ do
  @sender = StringIO.new
  @comm = Lineman::Utilities::CommHelper.new(@receiver, @sender)
end

When /^I enter (.)$/ do |@input|
  @sender = StringIO.new
  @comm = Lineman::Utilities::CommHelper.new(@receiver, @sender)
  @comm.receive(@input).should_not == "Danger Will Robinson!"
end

Then /^I should see (.*) Menu$/ do |menu|
  @sender = StringIO.new
  @comm = Lineman::Utilities::CommHelper.new(@receiver, @sender)
  @comm.receive(@input)
  @sender.string.split("\n").should include(menu + " Menu")
end
