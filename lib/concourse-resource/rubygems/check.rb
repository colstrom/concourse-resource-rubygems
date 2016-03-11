require 'contracts'
require 'concourse-resource/rubygems/core'

module RubyGems
  # Check Step
  class Check < Fuselage::Check
    include Core
  end
end
