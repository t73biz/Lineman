require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Lineman
  describe Core do
    def test_args(args = '/home/ronald/work/lineman_test_app')
      @args = []
      @args[0] = args
      return @args
    end
    
    def setup_spec
      @error = StringIO.new
      @input_channel = StringIO.new('1')
      @output_channel = StringIO.new
      @mock_kernel = mock(Kernel)
      @mock_kernel.stub!(:exit)
      @lineman = Core.new
      @lineman.args = @args
      @lineman.error = @error
      @lineman.input_channel = @input_channel
      @lineman.output_channel = @output_channel
      @lineman.kernel = @mock_kernel
      @lineman.comm.input_channel = @input_channel
      @lineman.comm.output_channel = @output_channel
    end

    context "start" do
      it "should check for options" do
        test_args('-q')
        setup_spec
        @mock_kernel.should_receive(:exit)
        @lineman.start.should be_false
      end
      
      it "should check for valid arguments" do
        test_args("/home/ronald/work -q ")
        setup_spec
        @lineman.start.should be_true
      end
      
      it "should output usage if invalid arguments or options" do
        test_args('-talapia fish')
        setup_spec
        @mock_kernel.should_receive(:exit)
        @lineman.start.should be_false
      end
      
      it "should return false if no working path was set" do
        setup_spec
        @lineman.args = []
        @lineman.start.should be_false
      end
      
      it "should store the working path and extract the project name if it is supplied" do
        test_args
        setup_spec
        @lineman.start.should be_true
        @lineman.project.path.should == "/home/ronald/work/lineman_test_app"
        @lineman.project.name.should == 'Lineman test app'
      end
    end
  end
end
