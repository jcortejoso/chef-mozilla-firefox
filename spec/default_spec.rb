require 'spec_helper'

describe 'mozilla-firefox::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it "installs firefox via ark" do
    expect(chef_run).to install_via_ark('firefox')
  end

  it "installs firefox dependencies" do
    expect(chef_run).to install_package('libgtk2.0-0')
    expect(chef_run).to install_package('libasound2')
    expect(chef_run).to install_package('libxt6')
  end
end
