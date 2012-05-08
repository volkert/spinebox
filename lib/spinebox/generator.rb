module Spinebox
  class Generator
    
    attr_reader :root
    
    # Creates a new app and copies the templates to the newly created directory
    def initialize app
      @app = app
      create_app_directory
      copy_templates
    end
    
    private
    def create_app_directory
      FileUtils.mkdir @app
      @root = File.realdirpath @app
    end
    
    def copy_templates
      FileUtils.cp_r "#{Spinebox.root}/templates/.", @root
    end
    
  end
end