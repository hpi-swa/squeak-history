preparation - private
excludedDaysFor: listName

	listName = 'squeak-dev' ifFalse: [^ #()].
	
	self flag: #workaround. "HyperKitty mbox archive endpoint currently returns corrupted/empty zip files for some days."
	^ {Date year: 2023 month: 10 day: 3}