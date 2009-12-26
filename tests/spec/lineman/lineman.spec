require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Lineman
  describe Core do
    context "starting up" do
      before(:each) do
        @messenger = mock("messenger").as_null_object
        @lineman = Core.new(@messenger)
      end
      it "should start" do
        @lineman.start
      end
      
      it "should send a welcome message" do
        @messenger.should_not == nil
        @lineman.start
      end
      
      it "should send a menu with instructions" do
        @messenger.should_receive(:puts).with("Select from the menu\nD)atabase\nG)ems\nM)VC\nP)lugins\nQ)uit\n")
        @lineman.start
      end

    end
  end
end
