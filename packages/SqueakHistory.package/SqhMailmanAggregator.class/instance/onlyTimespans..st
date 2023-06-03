accessing
onlyTimespans: timespans
	"For upcoming messages, consider only the messages that were sent within any ony of the specified timespans."

	self dateFilter: [:dateOrTimespan | timespans anySatisfy: [:timespan |
		(dateOrTimespan respondsTo: #start)
			ifFalse: [timespan includes: dateOrTimespan]
			ifTrue: [(timespan intersection: dateOrTimespan) notNil]]].