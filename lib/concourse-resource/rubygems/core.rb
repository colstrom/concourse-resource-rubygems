require 'contracts'

module ConcourseResource
  module RubyGems
    # Core functionality for all Resource Steps
    module Core
      include ::Contracts::Core
      include ::Contracts::Builtin
    end
  end
end
