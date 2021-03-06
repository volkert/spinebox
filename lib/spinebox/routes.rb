module Spinebox
  module Routes
    
    # Reset the routes
    def self.reset!
      @@app = nil
    end
    reset!
    
    # Draw the routes into a rack builder app
    def self.draw(&block)
      @@app = Rack::Builder.new(&block).to_app
    end
    
    # The rack app
    def self.app
      @@app
    end
    
  end
  
  
  class << self
    
    # Returns a rack builder app with the drawn routes
    def app
      Routes.app || begin
        Spinebox.boot!
        Routes.app
      end
    end
    
    # Load the routes
    def load_routes!(routes = "./config/routes.rb")
      load routes
    end
    
  end
end