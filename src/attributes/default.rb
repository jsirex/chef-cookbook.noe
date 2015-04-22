default!{name.split(/[_-]/).map{ |x| "['#{x}']"}.join}['foo'] = 'bar'
