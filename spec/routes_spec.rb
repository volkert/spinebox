require_relative "./helpers"

describe Spinebox do
  
  before(:each) do
    Spinebox::Routes.reset!
  end
  
  it "should load the routes from the default path" do
    Dir.chdir "#{Spinebox.root}/templates"
    
    Spinebox.app.should be_nil
    Spinebox.load_routes!
    Spinebox.app.should_not be_nil
  end
  
end