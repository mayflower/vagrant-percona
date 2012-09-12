class application {
    exec {
        "install_anemometer":
            command => "cat /vagrant/Sites/Anemometer/install.sql | mysql -uroot -proot",
            unless => 'mysql -B -uroot -proot -N  -e "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = \'slow_query_log\' AND TABLE_NAME = \'global_query_review_history\'" | grep "global_query_review_history"',
            require => Package["mysql-server"],
    }

}