require 'docker'
require 'serverspec'
require 'lib/helper'

Dir[File.dirname(__FILE__) + '/examples/**/*_examples.rb'].sort.each { |f| require f }
