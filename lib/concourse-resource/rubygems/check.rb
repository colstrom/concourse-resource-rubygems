require 'contracts'
require 'concourse-resource/rubygems/core'
require 'concourse-resource/rubygems/gem_not_found'

module RubyGems
  # Check Step
  class Check < Fuselage::Check
    include Core

    Contract None => ArrayOf[HashOf[String, String]]
    def versions
      Gems
        .versions(gem)
        .tap { |response| raise GemNotFound, response if response.is_a? String }
        .sort_by { |version| version['created_at'] }
        .map { |version| { 'version' => version.fetch('number') } }
    rescue GemNotFound => message
      STDERR.puts message
      abort
    end
  end
end
