#
# Cookbook Name:: mozilla-firefox
# Recipe:: default
#

version = node['mozilla-firefox']['version']
lang = node['mozilla-firefox']['language'] 

if node['mozilla-firefox']['64'] == true
  os = 'linux64'
else
  os = 'linux'
end

url = node['mozilla-firefox']['url'] || "https://download.mozilla.org/?product=firefox-#{version}-SSL&os=#{os}&lang=#{lang}"

ark 'firefox' do
  action :install
  url url
  version version
  extension "tar.bz2"
  has_binaries ['firefox']
end

directory node['mozilla-firefox']['profile_dir'] do
  action 'create'
  not_if { File.directory?(node['mozilla-firefox']['profile_dir']) }
end
template "#{node['mozilla-firefox']['profile_dir']}/#{node['mozilla-firefox']['profile_file']}" do
  source 'firefox_profile.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
bash 'reload_profile' do
  code "source #{node['mozilla-firefox']['profile_dir']}/#{node['mozilla-firefox']['profile_file']}"
end

node['mozilla-firefox']['dependencies'].each do |dep|
  package dep do
    action :install
  end
end
