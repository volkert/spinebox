require_relative "./helpers"

describe Spinebox::Command do

  it "should store commands" do
    Spinebox::Command.dispatch do
      on "--test, -t", "A test case", :if => proc { true } do
        
      end
      
      on "--test2, -t2", "A test case 2", :if => proc { true } do
        
      end
    end
    
    Spinebox::Command.commands.should have(2).command
  end
  
  it "should execute commands" do
    Spinebox::Command.execute
  end
  
end