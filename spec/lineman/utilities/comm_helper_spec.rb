require File.join(File.dirname(__FILE__), "..", "..", "spec_helper" )

module Lineman
  module Utilities
    describe CommHelper do
    def test_args(args = '/home/ronald/work/yourapp')
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
      @messages = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", "..", "..", 'lib/lineman/locale/en/messages.yml'))).to_hash
      @menus = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", "..", "..", 'lib/lineman/locale/en/menus.yml'))).to_hash
    end
    
     context "build_menu" do
        it "should recieve input" do
          test_args
          setup_spec
          @current_menu = 'Main'
          @lineman.comm.parse_input("1")
          @output_channel.string.should include(@menus['Database']['Title'] + "\n")
        end
      end
      context "send" do
        it "should display message section based on input" do
          test_args
          setup_spec
          @lineman.comm.output_to_channel('Welcome')
          @output_channel.string.should include(@messages['Welcome'])
        end
      end
    end
  end
end
