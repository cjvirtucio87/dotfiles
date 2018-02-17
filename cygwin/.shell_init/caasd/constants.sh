CAASD_AUTOMATION_PROJECT_DIR=$HOME/git/caasd-portal-automation
CAASD_AUTOMATION_DIR=$CAASD_AUTOMATION_PROJECT_DIR/src/main
PERL5LIB=$HOME/.developer/caasd-portal-automation/perllib:$CAASD_AUTOMATION_DIR/perllib:$PERL5LIB
http_proxy=http://gatekeeper-w.mitre.org:80
https_proxy=http://gatekeeper-w.mitre.org:80
no_proxy=".mitre.org,.portal.local,localhost,mm233581-pc,mm233581-pc.mitre.org,127.0.0.1"
HTTPS_CA_FILE=/usr/ssl/certs/ca-bundle.trust.crt

PATH=${CAASD_AUTOMATION_DIR}/scripts:${PATH}
