require_relative "./helpers"

describe Spinebox::Generator do
  
  context "app" do
    
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
  
    it "should be generated with name" do
      File.directory?("box").should_not be_true
    
      generator = Spinebox::Generator::Application.new "box"
      File.directory?(generator.root).should be_true
      Dir["#{generator.root}/**/*"].should have_at_least(5).files
    end
    
  end
  
  context "model" do
    
    before(:each) do
      Dir.chdir "#{Spinebox.root}/templates/app"
      Spinebox.boot!
    end
    
    it "should be generated with attributes" do
      File.exists?("app/assets/javascripts/app/models/post.js.coffee").should_not be_true
      
      generator = Spinebox::Generator::Model.new "post", ["title", "date", "author"]
      generator.source_name.should == "post"
      generator.name.should == "Post"
      generator.attributes.should == ["title", "date", "author"]
      generator.source.include?("App.Post").should be_true
      generator.source.include?("'title', 'date', 'author'").should be_true
      
      File.exists?("app/assets/javascripts/app/models/post.js.coffee").should be_true
      FileUtils.rm("app/assets/javascripts/app/models/post.js.coffee")
    end
    
  end
  
end