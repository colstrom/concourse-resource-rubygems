require 'contracts'
require 'concourse-fuselage'
require 'concourse-resource/rubygems/core'
require 'concourse-resource/rubygems/gem_not_found'

module ConcourseResource
  module RubyGems
    # Check Step
    class Check < Fuselage::Check
      include Core

      Contract None => ArrayOf[HashOf[String, String]]
      def versions
        ::Gems
          .versions(gem)
          .tap { |response| raise GemNotFound, response if response.is_a? String }
          .sort_by { |version| version['created_at'] }
          .map { |version| { 'version' => version.fetch('number') } }
      rescue GemNotFound => message
        STDERR.puts message
        abort
      end

      Contract None => HashOf[String, String]
      def latest
        versions.last
      end

      Contract HashOf[String, String] => ArrayOf[HashOf[String, String]]
      def since(version)
        versions[versions.index(version)..-1]
      end
    end
  end
end
