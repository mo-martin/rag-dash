#
# Cookbook Name:: jenkins
# Recipe:: java
#
Chef::Log.warn('The jenkins::java recipe has been deprecated. We recommend adding the Java coobook to the runlist of your jenkins node instead as it provides more tuneables')

case node['platform_family']
when 'debian'
  package 'openjdk-8-jdk'
when 'rhel'
  package 'java-1.8.0-openjdk'
else
  raise "`#{node['platform_family']}' is not supported!"
end
