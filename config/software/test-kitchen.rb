#
# Copyright:: Copyright (c) Seth Chisamore
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

name "test-kitchen"
version "1.0"
dependencies ["ruby", "rubygems", "bundler"]

source :git => "git://github.com/opscode/test-kitchen.git"

relative_path "test-kitchen"

build do
  gem "build test-kitchen.gemspec"
  gem "install test-kitchen-1.0*.gem -n #{install_dir}/bin --no-rdoc --no-ri"
end
