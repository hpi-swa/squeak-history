normalization - support
authorInitials

	^ authorInitials ifNil: [
		authorInitials := Dictionary new.
		
		SystemNavigation authors keysAndValuesDo: [:fullName :initials |
			authorInitials
				at: (self normalizedAuthorKeyFromName: fullName)
				put: initials].
			
		authorInitials]