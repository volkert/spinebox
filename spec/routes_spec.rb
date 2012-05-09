require_relative "./helpers"

describe Spinebox do
  
  before(:each) do
    Dir.chdir "#{Spinebox.root}/templates/app"
    Spinebox::Routes.reset!
  end
  
  it "should load the routes from the default path" do
    Spinebox.app.should be_a Rack::URLMap
  end
  
end