preparation
downloadList: listName from: spec forTimespans: timespans to: localPath
	"The list name will be added as an extra directory to the local path."

	| directory |
	directory := FileDirectory on: localPath, FileDirectory slash, listName.
	directory assureExistence.
	
	^ spec key caseOf:
		{[#hyperkitty] ->
			[self
				downloadList: listName
				fromHyperkitty: spec value
				forTimespans: timespans
				into: directory].
		[#pipermail] ->
			[self
				downloadList: listName
				fromPipermail: spec value
				forTimespans: timespans
				into: directory].
		[#pipermailWebArchive] ->
			[self
				downloadList: listName
				fromPipermailWebArchive: spec value
				into: directory]}