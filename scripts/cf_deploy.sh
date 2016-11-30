#!/bin/bash 

SCRIPT_DIR=$(cd `dirname $0` && pwd)

#app_context_path=""
domain="cfapps.io"
host_name="pcf-autoscaler-and-scheduler-personas"
app_name="persona_app"

#Assumes you have done the following:
# git clone https://github.com/slhommed/pcf-autoscaler-and-scheduler-personas
#cf login -a http://api.run.pivotal.io
#cf target -o <target_org> -s <target_space>
##

pushd $SCRIPT_DIR
pushd ..
bundle install
bundle exec middleman build
mkdir -p ./cfapp ### /$docs_app_context_path
cp -rf ./build/* ./cfapp/ ### /$docs_app_context_path
cf push $app_name -m 64M -b https://github.com/cloudfoundry/staticfile-buildpack.git -d $domain --hostname $host_name -p ./cfapp
popd
popd
