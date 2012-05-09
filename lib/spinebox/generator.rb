module Spinebox
  module Generator
    
    # Generates an application skeleton
    class Application
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
        FileUtils.cp_r "#{Spinebox.root}/templates/app/.", @root
      end
    end
    
    
    # Generates a model
    class Model
      
      attr_reader :name
      attr_reader :attributes
      attr_reader :source
      attr_reader :source_name

      def initialize name, attributes = []
        @name, @source_name, @attributes = name.camelize, name, attributes
        compile_template
        write_source
      end

      private
      def compile_template
        @source = ERB.new(File.open("#{Spinebox.root}/templates/model/model.js.coffee.erb").read).result(binding)
      end

      def write_source
        File.open("app/assets/javascripts/app/models/#{@source_name}.js.coffee", "w"){ |file| file.write(@source) }
      end

    end
    
    # Generates a controller
    class Controller
      
      attr_reader :name
      attr_reader :source
      attr_reader :source_name
      
      
      def initialize name
        @name, @source_name, @view_name = name.pluralize.camelize, name.pluralize, name.singularize
        compile_template
        write_source
      end

      private
      def compile_template
        @source = ERB.new(File.open("#{Spinebox.root}/templates/controller/controller.js.coffee.erb").read).result(binding)
      end

      def write_source
        File.open("app/assets/javascripts/app/controllers/#{@source_name}.js.coffee", "w"){ |file| file.write(@source) }
      end

    end
    
    
    # Generates a view
    class View
      
      attr_reader :name
      attr_reader :source
      attr_reader :source_name
      
      
      def initialize name
        @name, @source_name = name.camelize, name
        write_source
      end

      private
      def compile_template
        @source = ""
      end

      def write_source
        File.open("app/assets/javascripts/app/views/#{@source_name}.jst.eco", "w"){ |file| file.write(@source) }
      end

    end
    
    

  end
end