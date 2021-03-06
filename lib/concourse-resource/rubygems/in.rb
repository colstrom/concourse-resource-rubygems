require 'concourse-fuselage'
require 'contracts'
require 'httparty'
require_relative 'core'

module ConcourseResource
  module RubyGems
    # In Step
    class In < Fuselage::In
      include Core

      def filename
        @filename ||= "#{gem}-#{version.fetch 'number'}.gem"
      rescue KeyError
        STDERR.puts 'config.version is missing number', version
        abort
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
