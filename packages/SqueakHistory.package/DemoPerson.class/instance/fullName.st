accessing - convenience
fullName

	^ preferredName ifNil: [
			preferredName := 
				"Use the longest."
				((self fullNames collect: [:ea | ea -> ea size])
					sorted: [:a :b | a value < b value]) last key]