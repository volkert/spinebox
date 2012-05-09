module Spinebox
  module Base
    
    # The spinebox gem path
    def root
      File.dirname(File.realdirpath(__FILE__))
    end
    
    # Boot the spinebox environment
    def boot!
      Spinebox::Config.reset!
      Spinebox::Routes.reset!
      Spinebox.load_config!
      Spinebox.load_routes!
    end
    
  end
end