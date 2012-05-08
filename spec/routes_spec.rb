require_relative "./helpers"

describe Spinebox do
  
  before(:each) do
    Spinebox::Routes.reset!
  end
  
  it "should load the routes from the default path" do
    Dir.chdir "#{Spinebox.root}/templates"
    Spinebox.app.should be_a Rack::URLMap
  end
  
end