require 'concourse-fuselage'
require 'contracts'
require 'gems'
require_relative 'ambiguous_glob'
require_relative 'core'
require_relative 'support/source'

module ConcourseResource
  module RubyGems
    class Out < Fuselage::Out
      include Core
      include Support::Source

      Contract None => String
      def glob
        @glob ||= params.fetch('glob') { "pkg/#{gem}-*.gem" }
      end

      Contract None => ArrayOf[String]
      def files
        @files ||= Dir.glob(glob).tap do |matches|
          raise AmbiguousGlob, matches if matches.size > 1
        end
      rescue AmbiguousGlob => error
        STDERR.puts "Glob #{glob} matches too many files", error.message
        abort
      end

      Contract None => Any
      def configure!
        Gems.configure do |api|
          api.key = api_key
        end
      end

      def update!
        configure!
        files.each { |file| Gems.push file }
      end
    end
  end
end
