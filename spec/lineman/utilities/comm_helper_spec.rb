require File.join(File.dirname(__FILE__), "..", "..", "spec_helper" )

module Lineman
  module Utilities
    describe CommHelper do
    before(:each) do
        @sender = mock("sender").as_null_object
        @bad_input = %w{"d\n" "g\n" "Menu is cool\n" "p\n" "q\n"}
        @good_input = %w{"D\n" "G\n" "M\n" "P\n" "Q\n"}
        @comm = CommHelper.new(@sender)
      end
      context "Selecting Menu" do
        it "should recieve input" do
          @good_input.each do |input|
            @comm.receive(input)
          end
        end
        it "should send a response" do
          @good_input.each do |input|
            @comm.receive(input)
          end
          @sender.should_not == nil
        end
        it "should raise an error when given bad input" do
          @bad_input.each do |input|
            @comm.menu_parse(input).should_throw
          end
        end
      end
    end
  end
end
