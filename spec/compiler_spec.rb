require_relative "./helpers"

describe Spinebox::Compiler do
  
  context "compiler" do
    
    before(:each) do
      FileUtils.rm_rf("spec/tmp")
      FileUtils.mkdir("spec/tmp")
      Dir.chdir "spec/tmp"
      Spinebox::Generator.new "box"
      Dir.chdir "spec/tmp/box"
    end
    
    after(:each) do
      Dir.chdir ".."
      FileUtils.rm_rf("tmp")
    end
    
    it "should compile all javascripts to the public dir" do
      File.exists?("public/assets").should_not be_true
      
      Spinebox::Compiler.compile
      
      File.directory?("public/assets").should be_true
      Dir["public/assets/*"].should have_at_least(2).files
    end
    
  end
  
end