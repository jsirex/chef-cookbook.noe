# frozen_string_literal: true
default!{name.split(/[_-]/).map{ |x| "['#{x}']"}.join}['foo'] = 'bar'
