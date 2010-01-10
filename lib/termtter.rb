# -*- coding: utf-8 -*-

$KCODE = "u" unless Object.const_defined? :Encoding

$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) ||
                                          $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'

require 'cgi'
require 'enumerator'
require 'json'
require 'net/https'
require 'open-uri'
require 'optparse'
require 'readline'
gem 'rubytter', '>= 0.9.2'
require 'rubytter'
require 'timeout'

require 'termtter/version'
require 'termtter/config'
require 'termtter/default_config'
require 'termtter/optparse'
require 'termtter/command'
require 'termtter/hook'
require 'termtter/task'
require 'termtter/task_manager'
require 'termtter/hookable'
require 'termtter/memory_cache'
require 'termtter/rubytter_proxy'
require 'termtter/client'
require 'termtter/api'
require 'termtter/system_extensions'

module Termtter
  APP_NAME = 'termtter'
  CONF_DIR = config.system.conf_dir
  CONF_FILE = config.system.conf_file
  $:.unshift(Termtter::CONF_DIR)
end
