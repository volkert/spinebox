require_relative "./helpers"

describe Spinebox do
  
  it "should offer a block style config method" do
    Spinebox.config do |config|
      config.should be_a OpenStruct
      config.assets.should be_a Sprockets::Environment
      config.views.should be_a Sprockets::Environment
    end
  end
  
  it "should offer a normal configuration" do
    Spinebox.config.should be_a OpenStruct
    Spinebox.config.assets.should be_a Sprockets::Environment
    Spinebox.config.views.should be_a Sprockets::Environment
  end
  
  it "should offer straight access to the assets" do
    Spinebox.assets.should be_a Sprockets::Environment
    Spinebox.views.should be_a Sprockets::Environment
  end
  
  it "should load the config from the default path" do
    Dir.chdir "#{Spinebox.root}/templates"
    
    Spinebox.config.assets.paths.should have(0).paths
    Spinebox.load_config!
    Spinebox.config.assets.paths.should have_at_least(2).paths
  end
  
end