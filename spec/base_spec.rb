require_relative "./helpers"

describe Spinebox::Base do
  
  it "should return the root url of the gem" do
    File.exists?("#{Spinebox.root}/version.rb").should be_true
  end
  
  it "should load the config from the default path" do
    Dir.chdir "#{Spinebox.root}/templates"
    
    Spinebox.config.assets.paths.should have(0).paths
    Spinebox.load_config!
    Spinebox.config.assets.paths.should have_at_least(2).paths
  end
  
end