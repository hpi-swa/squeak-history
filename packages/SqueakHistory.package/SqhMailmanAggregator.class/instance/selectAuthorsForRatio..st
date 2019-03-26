queries
selectAuthorsForRatio: percentage
	"Which authors wrote more than <percentage> % of all messages?"
	
	^ self
		selectAuthorsForRatio: percentage
		countGenericKeys: true " *ALL* messages "