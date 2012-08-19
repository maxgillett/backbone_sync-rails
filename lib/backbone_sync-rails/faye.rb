require 'backbone_sync-rails/faye/observer'

module BackboneSync
  module Rails
    module Faye
      mattr_accessor :root_address
      self.root_address = 'http://localhost:3000'
    end
  end
end
