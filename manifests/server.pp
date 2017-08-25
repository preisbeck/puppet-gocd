# == Class: gocd::server
#
class gocd::server (
    String $package_name = 'go-server',
    ){

    package { $package_name :
        ensure => installed,
    }
}
