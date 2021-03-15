# copyright: 2018, The Authors
#

token     = attribute('token'     , description : 'token for vault'     )
url       = attribute('url'       , description : 'url for vault'       )
namespace = attribute('namespace' , description : 'namespace for vault' )
path      = attribute('path'      , description : 'path for vault'      )

title "Vault Integration Test"

control "vlt-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Test access to kv secret"             # A human-readable title
  desc "Test access to kv secret"
  describe http("#{url}/v1/#{namespace}/#{path}",
              method: 'GET',
              headers: {'X-Vault-Token' => "#{token}"}) do
    its('status') { should eq 200 }
  end
end

control "vlt-2.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Test health"             # A human-readable title
  desc "Test health"
  describe http("#{url}/v1/sys/health?perfstandbyok=true",
              method: 'GET') do
    its('status') { should eq 200 }
  end
end
