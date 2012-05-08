module Spinebox
  module Base
    
    # The spinebox gem path
    def root
      File.dirname(File.realdirpath(__FILE__))
    end
    
    def load_config!(config = "./config/config.rb")
      require config
    end
    
  end
end