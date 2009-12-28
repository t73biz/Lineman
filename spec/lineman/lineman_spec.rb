require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Lineman
  describe Core do
    def test_args(args = '/home/ronald/work/yourapp')
      @args = []
      @args[0] = args
      return @args
    end
    
    def setup_spec
      @error = StringIO.new
      @receiver = StringIO.new('D\n')
      @sender = StringIO.new
      @mock_kernel = mock(Kernel)
      @mock_kernel.stub!(:exit)
      @lineman = Core.new
      @lineman.args = @args
      @lineman.error = @error
      @lineman.receiver = @receiver
      @lineman.sender = @sender
      @lineman.kernel = @mock_kernel
      @help = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", "..", 'lib/lineman/locale/en/help.yml'))).to_hash
    end

    before(:each) do
    end

    context "start" do
      it "should check for options" do
        test_args('-h')
        setup_spec
        @lineman.start.should be_true
      end
      
      it "should check for valid arguments" do
        test_args("/home/ronald/work -q ")
        setup_spec
        @lineman.start.should be_true
      end
      
      it "should output usage if invalid arguments or options" do
        test_args('-t')
        setup_spec
        @mock_kernel.should_receive(:exit)
        @lineman.start.should be_false
      end
    end
  end
end
