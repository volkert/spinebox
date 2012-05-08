module Spinebox
  module Base
    
    # The spinebox gem path
    def root
      File.dirname(File.realdirpath(__FILE__))
    end
    
  end
end