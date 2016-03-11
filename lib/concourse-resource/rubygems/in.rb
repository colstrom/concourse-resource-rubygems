require 'contracts'
require 'concourse-fuselage'
require 'concourse-resource/rubygems/core'
require 'httparty'

module ConcourseResource
  module RubyGems
    # In Step
    class In < Fuselage::In
      include Core

      def filename
        @filename ||= "#{gem}-#{version.fetch 'number'}.gem"
      end

      def download
        @download ||= HTTParty.get "https://#{host}/gems/#{filename}"
      end

      def fetch!
        File.write "#{workdir}/#{filename}", download
      end
    end
  end
end
