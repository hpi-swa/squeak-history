private
recommend: queryString title: titleString ifAccepted: aBlock

	self isCI ifTrue: [^ nil].
	
	(Project uiManager confirm: queryString title: titleString) ifFalse: [^ nil].
	^ aBlock value