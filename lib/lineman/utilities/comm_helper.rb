# Main Lineman Module
module Lineman
  class CommHelper
    def initialize
      @messages = YAML.load(File.read(File.join(File.dirname(__FILE__), "..", 'messages.yml')))
    end
    
    def send(what)
      output = ""
      case what
        when "menu"
          output += @messages['Welcome'] + "\n"
          output += @messages['Menu']['Select'] + "\n"
          output += @messages['Menu']['D'] + "\n"
          output += @messages['Menu']['G'] + "\n"
          output += @messages['Menu']['M'] + "\n"
          output += @messages['Menu']['P'] + "\n"
          output += @messages['Menu']['Q'] + "\n"
        else
          output = "Danger Will Robinson!"
      end
      return output
    end
  end
end
