
JENKINS="http://localhost:8080"

#update jenkins plugins
UPDATE_LIST=$( jenkins-cli -s $JENKINS list-plugins | grep -e ')$' | awk '{ print $1 }' )
if [ ! -z "${UPDATE_LIST}" ]; then 
        echo Updating Jenkins Plugins: ${UPDATE_LIST};
        jenkins-cli -s $JENKINS install-plugin ${UPDATE_LIST};
fi
#install the needed plugins
jenkins-cli -s $JENKINS install-plugin git github job-dsl
sudo -u jenkins cp /vagrant/jenkins-config/*.xml /var/lib/jenkins/

jenkins-cli -s $JENKINS safe-restart


