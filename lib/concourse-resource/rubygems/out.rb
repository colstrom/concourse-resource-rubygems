require 'concourse-fuselage'
require 'contracts'
require_relative 'core'
require_relative 'support/source'

module ConcourseResource
  module RubyGems
    class Out < Fuselage::Out
      include Core
      include Support::Source

      Contract None => String
      def glob
        @glob ||= params.fetch('glob') { "#{workdir}/pkg/#{gem}-*.gem" }
      end

      Contract None => ArrayOf[String]
      def files
        @files ||= Dir.glob glob
      end
    end
  end
end
