require 'concourse-fuselage'
require 'contracts'
require_relative 'core'
require_relative 'support/source'

module ConcourseResource
  module RubyGems
    class Out < Fuselage::Out
      include Core
      include Support::Source
    end
  end
end
