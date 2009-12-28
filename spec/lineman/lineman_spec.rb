require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Lineman
  describe Core do
    def test_args(args = '/home/ronald/work/myapp')
      @args = []
      @args[0] = args
      return @args
    end
    
    def setup_spec
      @error = StringIO.new
      @receiver = StringIO.new
      @sender = StringIO.new
      @lineman = Core.new
      @lineman.args = @args
      @lineman.error = @error
      @lineman.receiver = @receiver
      @lineman.sender = @sender
      @help = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", "..", 'lib/lineman/help.yml'))).to_hash
    end

    context "start" do
      it "should check for parse options" do
        test_args('-h')
        setup_spec
        @lineman.start.should be_true
      end
      
      it "should check for validate arguments" do
        test_args
        setup_spec
        @lineman.start.should be_true
      end
      
      it "should output usage if invalid arguments or options" do
        test_args('-t')
        setup_spec
        @lineman.start.should be_false
      end
    end
  end
end
