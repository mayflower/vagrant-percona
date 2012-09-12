#TODO: doku
class screen {
  package {
    "screen":
        ensure => installed,
  }

  file {
    "/home/vagrant/.screenrc":
        ensure => file,
        source => "puppet:///modules/screen/.screenrc",
        owner => 'vagrant',
        group => 'vagrant',
        mode => 644,
        require => [Package["multitail"], Package["screen"]],
  }
}