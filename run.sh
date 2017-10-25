#!/bin/bash
set -e
cd ${TOMCAT_HOME}/newrelic
sed -i "s/log_level:\ info/log_level:\ finest/" newrelic.yml
sed -i "s/app_name:\ My\ Application/app_name:\ sample/" newrelic.yml
sed -i "s/<%= license_key %>/589ba8fc970b753b7f6e0f254755f6e65904c4a5/" newrelic.yml

cat ${TOMCAT_HOME}/newrelic/newrelic.yml
# 启动tomcat
nohup  ${TOMCAT_HOME}/bin/startup.sh &
# 启动tomcat on console for debug
#exec ${TOMCAT_HOME}/bin/catalina.sh run 
echo "startup finish"
# just keep this script running
while [[ true ]]; do
	sleep 1h
done
