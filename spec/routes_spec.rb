require_relative "./helpers"

describe Spinebox do
  
  before(:all) do
    Spinebox.routes{ "Map A" }
    Spinebox.routes{ "Map B" }
  end
  
  it "should offer a routes method" do
    Spinebox.routes.should have(2).routes
  end
  
  it "should setup all routes" do
    Dir.chdir "#{Spinebox.root}/templates"
    lambda{ Spinebox.setup_routes! }.should_not raise_error
  end
  
end