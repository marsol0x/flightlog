package { 'postgresql':
  ensure => installed,
}

$ruby_gems = [
  'sinatra',
  'activerecord'
]

package { $ruby_gems:
  ensure   => installed,
  provider => "gem",
}
