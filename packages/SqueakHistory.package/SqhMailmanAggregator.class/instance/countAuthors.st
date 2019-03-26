queries
countAuthors

	| authors |
	authors := Set new.
	self messagesCachedDo: [:wrapper | authors add: wrapper authorKey].
	^ authors size