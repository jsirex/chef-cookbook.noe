# Overriding some attributes for tests
default!{name.split(/[_-]/).map{ |x| "['#{x}']"}.join}['foo'] = 'baz'
