module Lineman
  class LogoHelper
    def self.logo
      puts "
          M        MM                                                                 
          M                                                                           
          M        MM   MM  MM~     :$MNO=    MM ?MMO~.?8MO~   8$DMD7,    M /DMO~     
          M        MM   MMIMMMM$  ,MM$.,?M~   MMMI.~DMMI,.DM$      ~8M    MMI,~DM$    
          M        MM   MM    MM  DM:    .N   MM,   .M,   .MM  ,7DMMMM    M,   .MM    
          M        MM   MM    MM  MMMMMMMMM   MM     M     MM OM8=. .M    M     MM    
          M        MM   MM    MM  7M$         MM     M     MM MM,   $M    M     MM    
          M        MM   MM    MM  ,NMZ,..~8   MM     M     MM 8MO::$MM    M     MM    
          MMMMMMMM MM   MM    MM    ,INMN8~   MM     M     MM  =8M8?.M    M     MM    
      ===============================================================================
      | Thanks for using Lineman. We're going to ask you a series of questions      |
      | about your project, and then start the build process. Don't worry about     |
      | getting a question wrong, or messing up. We try to collect all of the       |
      | information up front, and then apply that to the project. So, sit back,     |
      | relax, and enjoy the show!                                                  |
      ===============================================================================
      "
      exit! if CommHelper.parse_answer("Do you want to continue?") != TRUE
    end
    
    def self.database
      puts "
      ===============================================================================
      |                             DATABASE                                        |
      ===============================================================================
      | Next, We're going to ask you some questions about your database. Please     |
      | answer each question truthfully, as this will go better for all of us.      |
      | Don't mind the strange goat in the room behind you. He is only scaping.     |
      ===============================================================================
      "
    end
  end
end
