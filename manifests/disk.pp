#
define ccgswift::disk() {
    mount { "/srv/node/$name":
        device  => "/dev/$name",
        fstype  => $fstype,
        ensure  => "mounted",
        options => $fsoptions,
        atboot  => "true",
    }
}
