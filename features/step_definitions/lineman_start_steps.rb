
Given /^I start the app with ([^\"]*)$/ do |arg|
  @args = []
  @args[0] = arg
  @mock_kernel = mock(Kernel)
  @mock_kernel.stub!(:exit)
  @receiver = StringIO.new('D\n')
  @sender = StringIO.new
  @lineman = Lineman::Core.new
  @lineman.receiver = @receiver
  @lineman.sender = @sender
  @lineman.args = @args
  @lineman.kernel = @mock_kernel
  @lineman.comm.receiver = @receiver
  @lineman.comm.sender = @sender
end

Then /^lineman should fail$/ do
  @lineman.start.should be_false
end


Then /^lineman should_not fail$/ do
  @lineman.start.should be_true
end

