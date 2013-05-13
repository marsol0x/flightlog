$packages = [
  'postgresql',
  'libpq-dev'
]

package { $packages:
  ensure => installed,
}

$ruby_gems = [
  'sinatra',
  'activerecord',
  'sinatra-activerecord',
  'haml',
  'tilt',
  'rerun',
  'pg',
  'bcrypt-ruby'
]

package { $ruby_gems:
  ensure   => installed,
  provider => "gem",
}

class { 'postgresql::server':
  config_hash => {
    'ip_mask_deny_postgres_user' => '0.0.0.0/32',
    'ip_mask_allow_all_users'    => '0.0.0.0/0',
    'listen_addresses'           => '*',
    'ipv4acls'                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
    'manage_redhat_firewall'     => true,
    'postgres_password'          => 'TPSrep0rt!',
  },
}

postgresql::db { 'flightlog':
  user     => 'flightlog',
  password => 'flightlog'
}
