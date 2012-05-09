require_relative "./helpers"

describe Spinebox::ERBContext do
  
  before(:all) do
    Dir.chdir "#{Spinebox.root}/templates"
    Spinebox.boot!
  end
  
  context "javascript" do
    
    it "should offer asset tags concatenated" do
      Spinebox.config.concatenate = true
      javascript_include_tag("application").split("\n").should have(1).tag
    end
  
    it "should offer asset tags unconcatenated" do
      Spinebox.config.concatenate = false
      javascript_include_tag("application").split("\n").should have_at_least(5).tags
    end
    
  end
  
  context "css" do
    
    it "should offer asset tags concatenated" do
      Spinebox.config.concatenate = true
      stylesheet_link_tag("application").split("\n").should have(1).tag
    end
  
    it "should offer asset tags unconcatenated" do
      Spinebox.config.concatenate = false
      stylesheet_link_tag("application").split("\n").should have_at_least(1).tag
    end
    
  end
  
end