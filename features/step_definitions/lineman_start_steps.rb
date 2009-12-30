
Given /^I start the app with ([^\"]*)$/ do |arg|
  @args = []
  @args[0] = arg
  @mock_kernel = mock(Kernel)
  @mock_kernel.stub!(:exit)
  @input_channel = StringIO.new('D\n')
  @output_channel = StringIO.new
  @lineman = Lineman::Core.new
  @lineman.input_channel = @input_channel
  @lineman.output_channel = @output_channel
  @lineman.args = @args
  @lineman.kernel = @mock_kernel
  @lineman.comm.input_channel = @input_channel
  @lineman.comm.output_channel = @output_channel
end

Then /^lineman should fail$/ do
  @lineman.start.should be_false
end


Then /^lineman should_not fail$/ do
  @lineman.start.should be_true
end

