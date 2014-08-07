#
class ccgswift () {
    ccgswift::disk { 'sdb': }
    ccgswift::disk { 'sdc': }
    ccgswift::disk { 'sdd': }
    ccgswift::disk { 'sde': }
    ccgswift::disk { 'sdf': }
    ccgswift::disk { 'sdg': }
    ccgswift::disk { 'sdh': }
    ccgswift::disk { 'sdi': }
    ccgswift::disk { 'sdj': }
    ccgswift::disk { 'sdk': }
    ccgswift::disk { 'sdl': }

    file {'/etc/network/interfaces':
        content => template('ccgswift/interfaces.erb'),
    }

    # Fetch the ring files from $ring_host on each puppet run
    if ($hostname != $ring_host) {
        exec {"Updating ring files from $ring_host":
            command => "rsync -a rsync://swift@${ring_host}.rep.bpa.ccg/ring/*.gz /etc/swift",
            provider => shell
        }
    }

    # Do a file ownership fix; files are in flight so hide errors
    # Agents currently timeout here....
    # exec {"/bin/chown -R swift.swift /srv/node || exit 0":}
}
