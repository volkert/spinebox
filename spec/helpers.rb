require 'spinebox'

module Helpers
end

RSpec.configure do |config|
  config.include Helpers
  config.include Spinebox::ERBContext
  config.treat_symbols_as_metadata_keys_with_true_values = true
end