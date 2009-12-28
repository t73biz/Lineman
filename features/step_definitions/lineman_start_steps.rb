
Given /^I start the app with ([^\"]*)$/ do |arg|
    @args = []
    @args[0] = arg
    @lineman = Lineman::Core.new
    @lineman.receiver = StringIO.new("D\n")
    @lineman.sender = StringIO.new
    @lineman.args = @args
end

Then /^lineman should exit$/ do
  @lineman.start.should be_false
end


Then /^lineman should_not exit$/ do
  @lineman.start.should be_true
end

