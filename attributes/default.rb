default[:hosts_file][:include_ipv6] = false
default[:hosts_file][:path] = '/etc/hosts'
default[:hosts_file][:custom_entries] = {}
default[:hosts_file][:localhost_aliases] = []

default[:hosts_file][:fqdn] = node[:fqdn]
default[:hosts_file][:hostname] = node[:hostname]
default[:hosts_file][:public_ips] = 'hostname' # 'fqdn' or 'localhost'
