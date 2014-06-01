# -*- encoding : utf-8 -*-
require 'singleton'
require 'actionpool'
require "#{File.join(File.dirname(__FILE__), 'logger')}"
module WoolenCommon
    class ActionPoolProxy < BasicObject
        MAX_THREAD = 10
        include ::Singleton
        include ToolLogger

        def initialize
            @action_pool = ::ActionPool::Pool.new(:min_thread => 1, :max_thread => MAX_THREAD)
        end

        def method_missing(name, *args, &block)
            debug "invoke the action pool method: #{name}"
            begin
                @action_pool.send(name, *args, &block)
            rescue Exception => e
                error "we get the invoke process error::#{e.message}"
            end
        end
    end
end
