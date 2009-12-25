module Lineman
  class DocHelper
    def self.display(section)
      case section
        when "git"
          puts "
            Git is a versioning system commonly used by many projects and can be
            very benificial in helping to maintain a project. for more information
            on git and how to use it, please refer to http://git-scm.com/"
        else
          puts 'Unknown Help Section. Sorry'
      end
    end
  end
end
