# frozen_string_literal: true

name             '!{name}'
maintainer       '!{maintainer}'
maintainer_email '!{maintainer_email}'
license          '!{license}'
description      '!{description}'
long_description '!{long_description}'
issues_url       '!{issues_url}'
source_url       '!{source_url}'
version          '!{version}'

# depends 'cookbook', '>= 0.0.0'

# supports 'debian'
# supports 'centos'

chef_version '>= 12.12'

recipe '!{name}::default', '!{description}'
