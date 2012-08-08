require 'backbone_sync-rails/faye/event'

module BackboneSync
  module Rails
    module Faye
      module Observer
        def custom_after_update(model, *args)
          broadcast_event(model, :update, *args)
        end

        def custom_after_create(model, *args)
          broadcast_event(model, :create, *args)
        end

        def custom_after_destroy(model, *args)
          broadcast_event(model, :destroy, *args)
        end

        def custom_after_touch(model, *args)
          broadcast_event(model, :touch, *args)
        end

        def broadcast_event(model, event, *args)
          Event.new(model, event, *args).broadcast
        rescue *NET_HTTP_EXCEPTIONS => e
          handle_net_http_exception e
        end

        def handle_net_http_exception(exception)
          ::Rails.logger.error("")
          ::Rails.logger.error("Backbone::Sync::Rails::Faye::Observer encountered an exception:")
          ::Rails.logger.error(exception.class.name)
          ::Rails.logger.error(exception.message)
          ::Rails.logger.error(exception.backtrace.join("\n"))
          ::Rails.logger.error("")
        end
      end
    end
  end
end
