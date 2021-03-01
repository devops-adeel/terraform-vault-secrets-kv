# copyright: 2018, The Authors

title "sample section"

control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Test access to kv secret"             # A human-readable title
  desc "Test access to kv secret"
  describe http('http://localhost:8200/v1/secret/dev-adeel',
              method: 'GET',
              headers: {'X-Vault-Token' => "#{vault-token}"})
    its('status') { should cmp 200 }
  end
end

