# == Class: gocd::config
#
class gocd::config(
    Boolean $manage_repository = true,

    String $repository_name = 'GoCD Repository',
    String $fingerprint     = '322259C82D3082B3E32AEC2ED8843F288816C449',
    String $location        = 'https://download.gocd.org/',
    String $keyserver       = 'pgp.mit.edu',
    String $keysource       = 'https://download.gocd.org/GOCD-GPG-KEY.asc',
    ){
    if $manage_repository {
        include apt

        apt::source { $repository_name :
            location => $location,
            repos    => 'main',
            key      => {
                'id'     => $fingerprint,
                'server' => $keyserver,
            },
        }
    }
}
