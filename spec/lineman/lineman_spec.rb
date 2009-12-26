require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Lineman
  describe Core do
    before(:each) do
      @sender = mock("sender").as_null_object
      @lineman = Core.new(@sender)
    end
    context "Starting Up" do
      it "should start" do
        @lineman.start
      end
      
      it "should send a welcome message" do
        @sender.should_not == nil
        @lineman.start
      end
      
      it "should send a menu with instructions" do
        @sender.should_receive(:puts).with("Select from the menu\nD)atabase\nG)ems\nM)VC\nP)lugins\nQ)uit\n")
        @lineman.start
      end
    end # Starting Up End

    context "Selecting Menu" do
      it "should recieve input" do
        @input = "D\n"
        @comm = CommHelper.new(@sender)
        @comm.receive(@input)
      end
      
      it "should send a response" do
        @input = "D\n"
        @comm = CommHelper.new(@sender)
        @comm.receive(@input)
        @sender.should_match("Database Menu\n")
      end
      
    end
  end
end
