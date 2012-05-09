module Spinebox
  module Config
    
    # Reset the config
    def self.reset!
      @@configuration = nil
    end
    reset!
    
    # Offer the configuration
    def self.configuration(&block)
      @@configuration ||= OpenStruct.new(
        :assets => Sprockets::Environment.new,
        :views  => Sprockets::Environment.new
      )
      
      block.call(@@configuration) if block
      @@configuration
    end
    
  end
  
  class << self
    
    # Offers the configuration with the assets
    def config
      block = Proc.new if block_given?
      Config.configuration(&block)
    end
    
    # Straight access to the assets
    def assets
      config.assets
    end
    
    # Straight access to the views
    def views
      config.views
    end
    
    # Load the config
    def load_config!(config = "./config/config.rb")
      load config
    end
    
  end
end