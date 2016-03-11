FROM gems/concourse-fuselage

RUN gem-install concourse-resource-rubygems

RUN find $(gem environment gemdirs) -type f -path '*/concourse-resource-rubygems-*/bin/*' -exec ln -s '{}' \;
