require 'spec_helper'

describe file('/usr/local/bin/firefox') do
  it { should be_linked_to '/usr/local/firefox-31.0/firefox' }
end
