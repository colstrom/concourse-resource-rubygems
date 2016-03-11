require 'contracts'
require 'concourse-resource/rubygems/source'

module ConcourseResource
  module RubyGems
    # Core functionality for all Resource Steps
    module Core
      include ::Contracts::Core
      include ::Contracts::Builtin
      include Support::Source
    end
  end
end
