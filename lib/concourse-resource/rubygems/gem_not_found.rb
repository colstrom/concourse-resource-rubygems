require_relative 'error'

module ConcourseResource
  module RubyGems
    # Exception for when a Gem is not found
    class GemNotFound < Error
    end
  end
end
