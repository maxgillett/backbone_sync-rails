require 'backbone_sync-rails/faye/observer'

module BackboneSync
  module Rails
    module Faye
      mattr_accessor :root_address
      self.root_address = 'http://glacial-oasis-6992.herokuapp.com'
    end
  end
end
