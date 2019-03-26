queries
selectAuthorsForRatio: percentage countGenericKeys: boolean
	"Which authors wrote more than <percentage> % of all messages?"
	
	| authors level count result |
	self assert: (percentage between: 0.0 and: 1.0).
	
	authors := self aggregateAuthors associations.
	
	boolean ifFalse: [
		authors := authors reject: [:ea | self genericAuthorKeys includes: ea key]].
	 
	level := authors inject: 0 into: [:sum :each | sum + (each value at: #count)].
	level  := level * percentage.

	count := 0.
	result := OrderedCollection new: 200.

	authors := authors sorted: [:a :b |
		(a value at: #count) >= (b value at: #count)].
	authors do: [:each |
		count >= level ifTrue: [^ Dictionary newFrom: result].
		count := count + (each value at: #count).
		result add: each].
	
	^ Dictionary newFrom: result