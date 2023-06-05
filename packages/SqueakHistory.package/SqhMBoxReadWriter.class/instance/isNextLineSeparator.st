reading
isNextLineSeparator

	^ stream atEnd not
		and: [(self peekLine beginsWith: 'From ')
		and: [(self peekLines: 2) second beginsWith: 'From:' "no space here because there may be a linebreak before the actual address"]]