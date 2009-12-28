
Given /^I start the app with ([^\"]*)$/ do |arg|
  @args = []
  @args[0] = arg
  @mock_kernel = mock(Kernel)
  @mock_kernel.stub!(:exit)
  @lineman = Lineman::Core.new
  @lineman.receiver = StringIO.new("D\n")
  @lineman.sender = StringIO.new
  @lineman.args = @args
  @lineman.kernel = @mock_kernel
end

Then /^lineman should fail$/ do
  @lineman.start.should be_false
end


Then /^lineman should_not fail$/ do
  @lineman.start.should be_true
end

