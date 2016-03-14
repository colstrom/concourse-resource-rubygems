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

        Contract None => String
        def api_key
          @api_key ||= source.fetch 'api_key'
        rescue KeyError
          STDERR.puts 'Source is missing api_key'
          abort
        end
      end
    end
  end
end
