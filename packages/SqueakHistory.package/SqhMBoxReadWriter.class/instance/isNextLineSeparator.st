reading
isNextLineSeparator

	^ stream atEnd not
		and: [(self peekLine beginsWith: 'From ')
		and: [(self peekLines: 2) second beginsWith: 'From: ']]