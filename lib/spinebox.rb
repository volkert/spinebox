require "sprockets"
require 'coffee_script'
require 'eco'
require 'sass'
require "ostruct"

require "spinebox/version"
require "spinebox/base"
require "spinebox/config"
require "spinebox/routes"
require "spinebox/generator"

module Spinebox
  class << self
    include Spinebox::Base
  end
end
