#
# Cookbook Name:: omnibus
# Recipe:: builder
#
# Copyright:: Copyright (c) 2013 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt" if platform_family?("debian")
include_recipe "omnibus::ruby"
include_recipe "build-essential"
include_recipe "git"

[
  node['omnibus']['install_dir'],
  node['omnibus']['cache_dir']
].each do |dir|
  directory dir do
    owner node['omnibus']['build_user']
    mode 0755
    recursive true
  end
end

template ::File.join(node["omnibus"]["build_dir"], "omnibus.rb") do
  source "omnibus.rb.erb"
  owner node['omnibus']['build_user']
  mode 0744
end

# bundle install
execute "bundle install" do
  cwd node["omnibus"]["build_dir"]
end
