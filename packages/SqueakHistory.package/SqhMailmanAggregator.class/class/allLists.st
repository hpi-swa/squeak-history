defaults
allLists

	| squeakMigrated |
	squeakMigrated := #pipermail -> 'http://lists.squeakfoundation.org/pipermail/'. "no longer updated"
	squeakMigrated := #hyperkitty -> #('http://lists.squeakfoundation.org/archives/' 'lists.squeakfoundation.org').
	^ Dictionary new
		at: 'squeak-dev' put: squeakMigrated;
		at: 'beginners' put: squeakMigrated;
		at: 'vm-dev' put: squeakMigrated;
		at: 'vm-beginners' put: squeakMigrated;
		at: 'etoys-dev' put:
			"not migrated (yet?)"
			#pipermail -> 'http://lists.squeakfoundation.org/pipermail/';
		at: 'squeakland' put: squeakMigrated;
		
		"other lists"
		at: 'cuis-dev' put:
			#pipermail -> #('http://cuis-smalltalk.org/pipermail/' 'cuis-dev_cuis-smalltalk.org');
		at: 'cuis-dev-new' put:
			#pipermail -> #('http://lists.cuis.st/mailman/archives/' 'cuis-dev');
		at: 'tweak' put:
			#pipermailWebArchive -> 'http://web.archive.org/web/20070220151637/http://impara.de/pipermail/';
		
		yourself