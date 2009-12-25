require File.join(File.dirname(__FILE__), ".." ,"spec_helper" )

module Lineman
  describe Core do
    context "starting up" do
      it "should start" do
        messenger = mock("messenger").as_null_object
        lineman = Core.new(messenger)
        messenger.should_receive(:puts).with("Welcome to Lineman\nSelect from the menu\nD)atabase\nG)ems\nM)VC\nP)lugins\nQ)uit\n")
        lineman.start
      end
    end
  end
end
