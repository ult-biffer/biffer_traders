module BifferTraders
  class Engine < ::Rails::Engine
    isolate_namespace BifferTraders
    config.generators.api_only = true
  end
end
