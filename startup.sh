vagrant plugin install vagrant-gatling-rsync
vagrant plugin install vagrant-docker-compose

vagrant up 2>&1 | tee logs/console_log.txt
  vagrantport=$( grep -ic "Vagrant cannot forward the specified ports on this VM" logs/console_log.txt )
  if [ $vagrantport -eq 1 ]; then
    echo "Please open 'VirtualBox' and stop any server's that aren't in use. (Tip: CMD + F)"
    echo "Once done please type 'yes' to continue."
    read response
    if [ $response == 'yes' ] || [ $response == 'ye' ] || [ $response == 'y' ]; then
        vagrant up 2>&1 | tee logs/console_log.txt
        # link to top
    else
        echo "The script has not run."
    fi
  fi
