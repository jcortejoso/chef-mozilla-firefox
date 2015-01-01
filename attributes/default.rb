default['mozilla-firefox']['64'] = true
default['mozilla-firefox']['version'] = '31.0'
default['mozilla-firefox']['language'] = 'en-US'
default['mozilla-firefox']['crash-reporter'] = false
default['mozilla-firefox']['profile_dir'] = '/etc/profile.d'
default['mozilla-firefox']['profile_file'] = 'firefox'

default['mozilla-firefox']['dependencies'] = [
   'libgtk2.0-0',
   'libasound2',
   'libxt6'
]
