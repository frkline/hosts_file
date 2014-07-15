# Managed Hosts File

Manage your hosts file with chef.

### Base configurables:

* `default[:hosts_file][:path] = '/etc/hosts'`
* `default[:hosts_file][:localhost_aliases] = []`

### All Attributes

```ruby
default[:hosts_file][:include_ipv6] = false
default[:hosts_file][:path] = '/etc/hosts'
default[:hosts_file][:custom_entries] = {}
default[:hosts_file][:localhost_aliases] = []

default[:hosts_file][:fqdn] = node[:fqdn]
default[:hosts_file][:hostname] = node[:hostname]
default[:hosts_file][:public_ips] = 'hostname' # 'fqdn' or 'localhost'
```

### Via Attributes

```ruby

node.normal['hosts_file']['localhost_aliases'] = ['alias1.com', 'alias3.com']

override_attributes(
  :hosts_file => {
    :custom_entries => {
      '192.168.0.100' => 'www.google.com',
      '192.168.0.101' => %w(www.yahoo.com www.altavista.com)
    }
  }
)
```

### Via LWRP

```ruby
hosts_file_entry '192.168.0.100' do
  hostname 'www.google.com'
  aliases %w(google.com gmail.com www.gmail.com)
  comment "Override some google lookups"
end
```

and ensure you add the default recipe to the run list:

```ruby
run_list(["recipe[hosts_file]"])
```

### Repo:

* https://github.com/hw-cookbooks/hosts_file
