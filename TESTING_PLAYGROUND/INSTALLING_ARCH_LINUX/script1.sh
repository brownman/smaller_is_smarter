 $ curl -O https://mirrors.kernel.org/archlinux/iso/2014.05.01/archlinux-bootstrap-2014.05.01-x86_64.tar.gz
Extract the tarball:
 # cd /tmp
 # tar xzf <path-to-bootstrap-image>/archlinux-bootstrap-2014.04.01-x86_64.tar.gz
Select a repository server:
 # nano /tmp/root.x86_64/etc/pacman.d/mirrorlist

If you have bash 4 or later installed:
  # /tmp/root.x86_64/bin/arch-chroot /tmp/root.x86_64/



