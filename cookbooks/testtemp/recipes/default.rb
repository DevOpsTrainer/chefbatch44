#
# Cookbook:: testtemp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template "/tmp/service.xml" do
	source "server.xml.erb"
	mode "0644"
end

execute "rm /tmp/tomcat.properties" do
	only_if do
		File.exist?("/tmp/tomcat.properties")
		end
	notifies :restart, "service[httpd]"
end
