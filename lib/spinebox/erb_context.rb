module Spinebox
  module ERBContext
    
    def tommy
      "<h2>Tommmmmmmy</h2>"
    end
    
  end
  
  Spinebox.views.context_class.class_eval do
    include ERBContext
  end
end