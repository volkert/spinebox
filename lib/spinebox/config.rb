module Spinebox
  class << self
    
    # Offers the configuration with the assets
    def config
      @@configuration ||= OpenStruct.new(:assets => Sprockets::Environment.new)
      yield(@@configuration) if block_given?
      @@configuration
    end
    
    # Straight access to the assets
    def assets
      config.assets
    end
    
  end
end