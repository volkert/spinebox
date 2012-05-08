require_relative "./helpers"

describe Spinebox::Base do
  
  it "should return the root url of the gem" do
    File.exists?("#{Spinebox.root}/version.rb").should be_true
  end
  
end