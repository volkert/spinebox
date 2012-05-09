require_relative "./helpers"

describe Spinebox::Generator do
  
  before(:each) do
    Dir.chdir(File.dirname(__FILE__))
    FileUtils.rm_rf("tmp")
    FileUtils.mkdir("tmp")
    Dir.chdir "tmp"
  end
  
  after(:each) do
    Dir.chdir ".."
    FileUtils.rm_rf("tmp")
  end
  
  it "should generate app with name" do
    File.directory?("box").should_not be_true
    
    generator = Spinebox::Generator.new "box"
    File.directory?(generator.root).should be_true
    Dir["#{generator.root}/**/*"].should have_at_least(5).files
  end
  
end