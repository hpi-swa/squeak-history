instance creation
from: properties
	"Create or update a person entry using the given properties."

	KnownPersons ifNil: [KnownPersons := Dictionary new].
	
	(KnownPersons
		at: (properties at: #authorKey)
		ifAbsentPut: [self new]) in: [:person |
			
			"1) Update the persons's full name."
			person fullNames add: (properties at: #authorFullName).
			
			"2) Retain all mail addresses with date-and-time of last use."
			person mailAddresses
				at: (properties at: #mailAddress)
				ifAbsentPut: [properties at: #dateAndTime]
				ifPresentPut: [:stamp |
					(properties at: #dateAndTime) in: [:newStamp |
						newStamp > stamp
							ifTrue: [newStamp]
							ifFalse: [stamp]]].
			
			^ person].