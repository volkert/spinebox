module Spinebox
  module Command
    
    @@commands = []
    
    # Registers a command to dispatch
    def self.on command, desc, options = {}
      @@commands << Command.new(command, desc, options, &Proc.new)
    end
    
    # Executes the matching commands
    def self.execute
      @@commands.each { |command| command.run! }
    end
    
    # Dispatches the command registering block and executes the matching commands
    def self.dispatch
      raise "Nothing to dispatch" unless block_given?
      self.module_exec(&Proc.new)
      execute
    end
    
    # The registered commands
    def self.commands
      @@commands
    end
    
    # Combines the information of all registered commands and concatenates them to a string
    def self.help
      puts "Usage:"
      printf "%-3s %s\n\n", "", "spinebox new APP_PATH"
      
      puts "Options:"
      @@commands.each { |command| printf "%-3s %-20s %s\n", "", command.command, command.desc if command.options[:type] == :option }
      
      puts ""
      
      puts "Actions:"
      @@commands.each { |command| printf "%-3s %-20s %s\n", "", command.command, command.desc if command.options[:type] == :action }
      
      puts ""
      
      puts "Generators:"
      @@commands.each { |command| printf "%-3s %-40s %s\n", "", command.command, command.desc if command.options[:type] == :generator }
      
      puts ""
      
      puts "Scaffolds:"
      @@commands.each { |command| printf "%-3s %-40s %s\n", "", command.command, command.desc if command.options[:type] == :scaffold }
    end
    
    # Encapsules a registered command
    class Command
      
      attr_reader :command
      attr_reader :desc
      attr_reader :options
      
      def initialize command, desc, options, &block
        @command, @desc, @options, @block = command, desc, options, block
      end
      
      def run!
        return false unless @options[:if].call
        @block.call
      end
      
    end
    
  end
end