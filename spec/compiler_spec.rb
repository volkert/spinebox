require_relative "./helpers"

describe Spinebox::Compiler do
  
  before(:each) do
    Dir.chdir "#{Spinebox.root}/templates"
    Spinebox.boot!
    File.new("app/assets/images/test.png", "w")
  end
  
  after(:each) do
    FileUtils.rm_rf "app/assets/images/test.png"
    FileUtils.rm_rf "public"
  end
  
  it "should compile the assets and views to the public folder" do
    Dir["public/**/*"].should be_empty
    
    Spinebox::Compiler.compile
    
    [
      "public/assets/application.js",
      "public/assets/application.css",
      "public/assets/test.png",
      "public/index.html"
    ].each{ |file| File.exists?(file).should be_true }
  end
  
end