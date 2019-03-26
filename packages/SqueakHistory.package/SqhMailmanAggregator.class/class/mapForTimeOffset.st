preparation
mapForTimeOffset

	^ Dictionary newFrom: {
			'utc' -> '0000'.

			'met' -> '0100'.
			'cet' -> '0100'.
			'mest' -> '0200'.
			'cest' -> '0200'.
			
			'et' -> '-0500'.
			'est' -> '-0500'.
			'edt' -> '-0400'.
			'edst' -> '-0400'.
			 }