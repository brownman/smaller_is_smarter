

Method 2: Using the LiveCD Image
It is possible to mount the root image of the latest Arch Linux installation media and then chroot into it. This method has the advantage of providing you with a working Arch Linux installation right within your host system without the need to prepare it by installing specific packages.




Note: Before proceeding, make sure the latest version of squashfs is installed on the host system. Otherwise you will get errors like: FATAL ERROR aborting: uncompress_inode_table: failed to read block.


sudo apt-get install squashfs
echo http://sourceforge.net/projects/squashfs/files/latest/download?source=files

