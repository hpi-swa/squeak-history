as yet unclassified
aggregateSenders

	^ Bag new addAll: ((self allMails
			reject: [:m | #('<commits>' 'GitHub' 'cog' 'AppVeyor' 'Travis CI') includes: m sender fullName])
			collect: #sender); yourself