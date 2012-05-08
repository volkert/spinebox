module Spinebox
  class << self
    
    @@routes = []
    
    # Adds or returns all route blocks
    def routes
      return @@routes unless block_given?
      @@routes << Proc.new
    end
    
    # Executes the routes blocks
    def setup_routes!
      Spinebox.load_config!
      @@routes.each{ |route| route.call }
    end
    
  end
end