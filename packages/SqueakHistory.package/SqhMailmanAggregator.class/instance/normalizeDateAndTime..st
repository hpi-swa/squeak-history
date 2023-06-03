normalization
normalizeDateAndTime: mailMessage
	"Repair date information."

	| sep dat offset |
	mailMessage fields
		at: 'squeak-date' ifPresent: [:date | ^ self].
	
	sep := (mailMessage fieldNamed: 'separator' ifAbsent: [^ self]) mainValue.
	sep ifEmpty: [^ self].
	sep := (sep findTokens: Character space) last: 4.
	
	"From ... Tue Dec 23 12:18:13 1997"
	sep := DateAndTime
		date: (Date
			year: sep fourth asInteger
			month: (Date indexOfMonth: sep first)
			day: sep second asInteger)
		time: (Time fromString: sep third).
	
	dat := (mailMessage fieldNamed: 'date' ifAbsent: [^ self]) mainValue.
	dat ifEmpty: [^ self].
	dat := dat findTokens: Character space.
	
	dat := (dat fourth includesSubstring: ':')
		ifTrue: ["Time: 22:42:23"
			(Number readFrom: dat first ifFail: [0]) > 0
				ifTrue: ["Date: 11 Aug 2010 22:42:23 +0000"
					offset := Duration days: 0 hours: dat fifth asInteger // 100 minutes: 0 seconds: 0.
					dat := DateAndTime
						date: (Date
							year: dat third asInteger
							month: (Date indexOfMonth: dat second)
							day: dat first asInteger)
						time: (Time fromString: dat fourth).
					dat sqhAsLocalAt: offset]
				ifFalse: ["Date: Sat Jan 28 04:00:35 2012"
					DateAndTime
						date: (Date
							year: dat fifth asInteger
							month: (Date indexOfMonth: dat second)
							day: dat third asInteger)
						time: (Time fromString: dat fourth)]]
		ifFalse: [
			"Date: Thu, 5 Jul 2018 07:56:42 -0400"
			"Date: Wed, 27 Apr 2005 22:25:16 EDT"
			self flag: #performance.
			(self class mapForTimeOffset includesKey: dat sixth asLowercase)
				ifTrue: [dat at: 6 put: (self class mapForTimeOffset at: dat sixth asLowercase)].
			
			offset := Duration days: 0 hours: dat sixth asInteger // 100 minutes: 0 seconds: 0.
			dat := DateAndTime
				date: (Date
					year: dat fourth asInteger
					month: (Date indexOfMonth: dat third)
					day: dat second asInteger)
				time: (Time fromString: dat fifth).
			dat sqhAsLocalAt: offset].
	self flag: #discuss. "ct: Should we also apply offset to sep (sep offset: offset with Squeak6.1 semantics) or is there no guarantee that it is specified in UTC?"
	
	"Write results into mail message."
	(mailMessage fields at: 'date') first mainValue: dat printString.
	(mailMessage fields at: 'date') add: (MIMEHeaderValue forField: 'date' fromString: sep printString).
	
	"Pick the better date for later."
	mailMessage fields
		at: 'squeak-date'
		put: (sep year < dat year ifTrue: [sep] ifFalse: [dat]).