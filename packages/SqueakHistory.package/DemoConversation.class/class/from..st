instance creation
from: spec

	^ self new
		starter: spec key;
		wrappers: spec value;
		yourself