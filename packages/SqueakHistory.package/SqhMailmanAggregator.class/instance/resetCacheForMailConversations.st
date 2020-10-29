preparation - conversations cache
resetCacheForMailConversations
	
	| tmp |
	tmp := Dictionary new: 5000.
	
	self messagesCachedDo: [:wrapper |
		(tmp
			at: wrapper inReplyToFirst
			ifAbsentPut: [Set new])
				add: wrapper].

	"Try to merge broken chains due to missing mails (or wrong message ids)."
	(tmp keys select: [:w | w mailMessageInReplyTo notNil]) do: [:a | tmp keys detect: [:b |
		(a ~~ b and: [a subject = b subject "TODO: Edit distance?"])
			ifFalse: [false]
			ifTrue: [
				a setProperty: #wrapperInReplyTo toValue: b. "We don't know better."
				(tmp at: b) addAll: (tmp at: a). tmp removeKey: a. true]] ifNone: ["Ignore"]]
		displayingProgress: [:w | 'Merging conversations...'].	
			
	"Transcript showln: tmp keys size."

	CachedConversations := OrderedDictionary new: 5000.	
	(tmp keys sorted: [:a :b | a dateAndTime >= b dateAndTime])
		do: [:startId |
			CachedConversations
				at: startId
				put: ((tmp at: startId) sorted: [:a :b | a dateAndTime >= b dateAndTime])].