module ConcourseResource
  module RubyGems
    VERSION = $LOADED_FEATURES
                .map { |f| f.match %r{/concourse-resource-rubygems-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+(\.pre)?)} }
                .compact
                .map { |gem| gem['version'] }
                .uniq
                .first
  end
end
