class percona {
    package {
        "wget":
            ensure => installed,
    }

    exec {
        "get_percona":
            command => "wget percona.com/get/percona-toolkit.deb",
            creates => "/home/vagrant/percona-toolkit.deb"
            require => [Package["wget"]],
    }

    exec {
        "install_percona":
            command => "sudo dpkg -i /home/vagrant/percona-toolkit.deb",
            unless => "dpkg -s 'percona*' | grep ok",
            require => [Exec["get_percona"]],
    }
}