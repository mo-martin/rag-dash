#
# Cookbook Name:: jenkins_config
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

template '/var/lib/jenkins/config.xml' do
  source 'jenkinsconfig.rb'
end
