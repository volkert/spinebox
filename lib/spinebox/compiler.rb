module Spinebox
  module Compiler
    
    # Compiles the assets and the views into the public folder
    def self.compile
      Spinebox.config.concatenate = true
      create_directories
      compile_javascripts
      compile_stylesheets
      compile_views
      copy_images
    end
    
    private
    def self.create_directories
      Dir.mkdir "public"         unless File.directory?("public")
      Dir.mkdir "public/assets"  unless File.directory?("public/assets")
    end
    
    def self.compile_javascripts
      asset = Spinebox.assets["application.js"]
      asset.write_to(File.join("public/assets", asset.logical_path))
    end
    
    def self.compile_stylesheets
      asset = Spinebox.assets["application.css"]
      asset.write_to(File.join("public/assets", asset.logical_path))
    end
    
    def self.compile_views
      Spinebox.views.each_logical_path do |logical_path|
        asset = Spinebox.views[logical_path]
        asset.write_to(File.join("public", asset.logical_path))
      end      
    end
    
    def self.copy_images
      FileUtils.cp_r "app/assets/images/.", "public/assets"
    end
    
  end
end