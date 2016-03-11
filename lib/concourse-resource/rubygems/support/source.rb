require 'contracts'

module ConcourseResource
  module RubyGems
    module Support
      # Params for GemResource
      module Source
        include ::Contracts::Core
        include ::Contracts::Builtin

        Contract None => String
        def gem
          @gem ||= source.fetch 'gem'
        rescue KeyError
          STDERR.puts 'Params is missing gem'
          abort
        end

        Contract None => String
        def host
          @host ||= source.fetch('host') { 'rubygems.org' }
        end
      end
    end
  end
end
