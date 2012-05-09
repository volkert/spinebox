require "sprockets"
require "rack"
require 'coffee_script'
require 'eco'
require 'sass'
require "colorize"
require "ostruct"
require 'active_support/all'
require 'erb'

require "spinebox/version"
require "spinebox/base"
require "spinebox/command"
require "spinebox/config"
require "spinebox/routes"
require "spinebox/erb_context"
require "spinebox/generator"
require "spinebox/compiler"

module Spinebox
  class << self
    include Spinebox::Base
  end
end
