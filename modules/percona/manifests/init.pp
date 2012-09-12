class percona {
    package {
        "libterm-readkey-perl":
            ensure => installed,
    }

    file {
        "copy_percona":
            path => "/home/vagrant/percona-toolkit_2.1.3_all.deb",
            ensure => file,
            source => "puppet:///modules/percona/percona-toolkit_2.1.3_all.deb",
    }

    exec {
        "install_percona":
            command => "sudo dpkg -i /home/vagrant/percona-toolkit_2.1.3_all.deb",
            unless => 'dpkg -l | grep "percon"',
            require => [File["copy_percona"], Package["libterm-readkey-perl"]],
    }
}