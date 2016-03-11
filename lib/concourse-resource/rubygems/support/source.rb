require 'contracts'

module ConcourseResource
  module RubyGems
    module Support
      # Params for GemResource
      module Source
        Contract None => String
        def gem
          @gem ||= source.fetch 'gem'
        rescue KeyError
          STDERR.puts 'Params is missing gem'
          abort
        end
      end
    end
  end
end
