require 'contracts'
require 'concourse-fuselage'
require 'concourse-resource/rubygems/core'

module ConcourseResource
  module RubyGems
    # In Step
    class In < Fuselage::In
      include Core

      def filename
        @filename ||= "#{gem}-#{version.fetch 'number'}.gem"
      end
    end
  end
end
