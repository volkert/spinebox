module Spinebox
  module ERBContext
    
    # Includes javascript tags in the erb. If concatenation is disabled it returns multiple tags,
    # otherwise it returns a single application tag.
    def javascript_include_tag source
      if Spinebox.config.concatenate
        javascript_tag_for(asset_for(source, 'js'))
      else
        asset_for(source, 'js').to_a.map{ |asset| javascript_tag_for asset, :body => 1 }.join("\n")
      end
    end
    
    # Includes javascript tags in the erb. If concatenation is disabled it returns multiple tags,
    # otherwise it returns a single application tag.
    def stylesheet_link_tag source, options = {}
      if Spinebox.config.concatenate
        stylesheet_tag_for(asset_for(source, 'css'), options)
      else
        asset_for(source, 'css').to_a.map{ |asset| stylesheet_tag_for asset, options.merge!({ :body => 1 }) }.join("\n")
      end
    end
    
    private
    
    # Access an asset from the assets
    def asset_for source, extension
      Spinebox.assets[source.include?(".#{extension}") ? source : "#{source}.#{extension}"]
    end
    
    # Build a javascript tag with body options
    def javascript_tag_for asset, options = {}
      "<script src='/assets/#{asset.logical_path}#{"?body=1" if options[:body]}' type='text/javascript'></script>"
    end
    
    # Build a stylesheet link with body options
    def stylesheet_tag_for asset, new_options = {}
      options = { :media => "all", :rel => "stylesheet" }.merge!(new_options)
      "<link href='/assets/#{asset.logical_path}#{"?body=1" if options[:body]}' media='#{options[:media]}' rel='#{options[:rel]}' type='text/css'>"
    end
    
  end
  
  # Include ERB context in the ERB evaluation of sprockets
  module ::Sprockets
    class Context
      include Spinebox::ERBContext
    end
  end
  
end