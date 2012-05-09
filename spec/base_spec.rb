require_relative "./helpers"

describe Spinebox::Base do
  
  it "should return the root url of the gem" do
    File.exists?("#{Spinebox.root}/version.rb").should be_true
  end
  
  it "should boot" do
    Dir.chdir "#{Spinebox.root}/templates/app"
    lambda{ Spinebox.boot! }.should_not raise_exception
  end
  
end