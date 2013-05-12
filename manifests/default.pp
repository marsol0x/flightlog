package { 'postgresql':
  ensure => installed,
}

$ruby_gems = [
  'sinatra',
  'activerecord',
  'haml',
  'tilt',
  'rerun'
]

package { $ruby_gems:
  ensure   => installed,
  provider => "gem",
}
