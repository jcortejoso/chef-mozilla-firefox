def install_via_ark(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:ark, :install, resource_name)
end
