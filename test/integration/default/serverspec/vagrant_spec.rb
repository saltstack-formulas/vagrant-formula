require 'serverspec'

set :backend, :exec

describe command("which vagrant") do
  its(:exit_status) { should eq 0 }
end

describe command("vagrant plugin list | grep vagrant-aws") do
  its(:exit_status) { should eq 0 }
end
