require 'contracts'
require 'concourse-fuselage'
require 'concourse-resource/rubygems/core'
require 'http'

module ConcourseResource
  module RubyGems
    # In Step
    class In < Fuselage::In
      include Core

      def filename
        @filename ||= "#{gem}-#{version.fetch 'number'}.gem"
      end

      def download
        @download ||= HTTP.get "https://#{host}/gems/#{filename}", follow: true
      end
    end
  end
end
