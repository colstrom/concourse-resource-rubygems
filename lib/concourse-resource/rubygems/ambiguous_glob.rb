require_relative 'error'

module ConcourseResource
  module RubyGems
    # Exception for ambiguous globbing
    class AmbiguousGlob < Error
    end
  end
end
