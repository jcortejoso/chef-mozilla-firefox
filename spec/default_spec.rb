require 'spec_helper'

describe 'mozilla-firefox::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it "installs firefox via ark" do
    expect(chef_run).to install_via_ark('firefox')
  end
end
