accessing - convenience
mailAddress
	"Returns the most recent mail address of the receiver."
	
	^ (self mailAddresses associations sorted: [:a :b |
		a value > b value]) first