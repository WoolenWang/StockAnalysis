# -*- encoding : utf-8 -*-
require "#{File.join(File.dirname(__FILE__),'src','config_manager')}"
WoolenCommon::ConfigManager.project_root = File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
require "#{File.join(File.dirname(__FILE__),'src','logger')}"
require "#{File.join(File.dirname(__FILE__),'src','system_helper')}"
require "#{File.join(File.dirname(__FILE__),'src','action_pool_proxy')}"
require "#{File.join(File.dirname(__FILE__),'src','ssh_proxy')}"
