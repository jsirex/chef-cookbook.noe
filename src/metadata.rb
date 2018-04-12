# frozen_string_literal: true

name             '!{name}'
maintainer       '!{maintainer}'
maintainer_email '!{maintainer_email}'
license          '!{license}'
description      '!{description}'
version          '!{version}'

issues_url       '!{issues_url}'
source_url       '!{source_url}'

supports 'debian'
# supports 'centos'

# depends 'cookbook', '>= 0.0.0'

chef_version !{ chef_version == 'latest' ? "'>= 14'" : "'~> #{chef_version}'" }

# Provided recipes
recipe '!{name}::default', '!{description}'

# Automatically installed gems before chef run (new in 12.8)
# gem 'whatever'
