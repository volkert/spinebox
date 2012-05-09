module Spinebox
  module Command
    
    @@commands = []
    
    def self.dispatch
      raise "Nothing to dispatch" unless block_given?
      yield
      execute
    end
    
    def self.on command, desc, options = {}
      @@commands << Command::Command.new(command, desc, options, &Proc.new)
    end
    
    def self.execute
      @@commands.each { |command| command.run! }
    end
    
    class Command
      
      def initialize command, desc, options, &block
        @command, @desc, @options, @block = command, desc, options, block
      end
      
      def run!
        return false unless @options[:if].call
        @block.call
        exit(0)
      end
      
    end
    
  end
end