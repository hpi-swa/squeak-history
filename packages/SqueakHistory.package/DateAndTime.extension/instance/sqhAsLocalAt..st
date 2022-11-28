*SqueakHistory-squeak protocol
sqhAsLocalAt: anOffset
	"Answer a DateAndTime for a different time zone offset that has the same
	year, month, day, hour, minute, and second as this instance, and with
	printString that matches except for time zone offset."
	"Sqh: copied from #asLocalAt: as backport for Squeak 6.0 and earlier"

	| newOffset newMicros |
	newOffset := anOffset asDuration asSeconds.
	newMicros := localOffsetSeconds - newOffset * 1000000 + utcMicroseconds.
	^ self class utcMicroseconds: newMicros offset: newOffset
