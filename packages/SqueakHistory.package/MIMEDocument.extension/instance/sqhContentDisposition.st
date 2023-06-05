*SqueakHistory-accessing-backport
sqhContentDisposition

	^ (self fieldNamed: 'content-disposition' ifAbsent: [MIMEHeaderValue fromMIMEHeader: 'inline'])
		mainValue