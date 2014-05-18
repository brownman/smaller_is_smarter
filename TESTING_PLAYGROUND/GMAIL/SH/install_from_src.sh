

check_sendmail() {

    if [ ! -x "/usr/bin/sendEmail" ]; then
        echo "sendEmail not installed"
        echo "Installing sendEmail..."
        sleep 1s
        wget -cnd "${download_sendEmail}" -O /tmp/sendemail.tar.gz >/dev/null 2>&1
        tar -xzf /tmp/sendemail.tar.gz  --wildcards  *sendEmail
        install --mode=744 sendEmail*/sendEmail /usr/bin/
#package_manager_install="yum install"
package_manager_install="sudo apt-get install"
        cmd="$package_manager_install perl-Net-SSLeay perl-Net-SMTP-SSL"
        echo "$cmd"
        echo
        eval "$cmd"
    fi
}


