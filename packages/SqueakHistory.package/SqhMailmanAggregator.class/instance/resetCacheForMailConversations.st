preparation - conversations cache
resetCacheForMailConversations

	| tmp |
	tmp := Dictionary new: 5000.
	
	self copy
		mailingLists: self class allListNames; "because CachedConversations is global for all mailing lists"
		messagesCachedDo: [:wrapper |
			(tmp
				at: wrapper inReplyToFirst
				ifAbsentPut: [Set new])
					add: wrapper].
	
	"Try to merge broken chains due to missing mails (or wrong message ids)."
	(tmp keys select: [:w | w mailMessageInReplyTo notNil and: [self dateFilter ifNil: [true] ifNotNil: [:filter | filter value: w dateAndTime]]])
		do: [:a | tmp keys
			detect: [:b |
				(a ~~ b and: [(a subject = b subject) flag: #todo "Edit distance?"])
					ifTrue: [
						a setProperty: #wrapperInReplyTo toValue: b.
						"We don't know better."
						(tmp at: b) addAll: (tmp at: a).
						tmp removeKey: a];
					yourself]
				ifNone: ["Ignore"]]
		displayingProgress: [:w | 'Merging conversations...'].
	
	"Transcript showln: tmp keys size."
	
	CachedConversations := OrderedDictionary new: 5000.
	(tmp keys sorted: [:ea | ea dateAndTime] descending) do: [:startId |
		CachedConversations
			at: startId
			put: ((tmp at: startId) sorted: [:ea | ea dateAndTime] descending)].