accessing - raw
fixMessageId: id

	| tmp |
	tmp := id.
	tmp first = $< ifFalse: [tmp := '<', tmp].
	tmp last = $> ifFalse: [tmp := tmp, '>'].
	^ tmp