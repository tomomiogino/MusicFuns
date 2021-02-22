server '54.248.16.177', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tm/.ssh/id_rsa'