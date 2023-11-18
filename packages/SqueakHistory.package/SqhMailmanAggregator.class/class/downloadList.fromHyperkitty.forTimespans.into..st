preparation
downloadList: listName fromHyperkitty: spec forTimespans: timespans into: directory

	| baseUrl mailDomain exclusiveEnd allChunkDays downloadChunk |
	baseUrl := spec first.
	mailDomain := spec second.
	
	"Download messages in chunks to enable progress updates (during downloading and later enumeration). Overhead per chunk download is approx. 150 ms (Windows 10, 40 mbit/s down, 10 mbit/s up, ping 25ms)."
	allChunkDays := timespans collect: [:timespan |
		| chunkSize |
		chunkSize := timespan duration /
			(100 * (timespan duration / (timespans collect: #duration) sum)).
		chunkSize := chunkSize clampLow: 7 days high: 365 days.
		"trade-off between fluent progress and small overhead."
		exclusiveEnd := timespan end asDate +
			(timespan end asTime > Time midnight) asBit days "url end parameter is exclusive".
		Array streamContents: [:stream |
			timespan every: chunkSize do: [:date |
				stream nextPut: date].
			exclusiveEnd - stream peekLast > 1 nanoSecond ifTrue:
				[stream nextPut: exclusiveEnd]]].
	
	downloadChunk := [:startDay :endDay |
		| startString endString fileName mboxUrl |
		startString := startDay asDate yyyymmdd.
		endString := (endDay asDate + (endDay asTime > Time midnight) asBit days "fix rounding errors, url end parameter is exclusive")
			yyyymmdd.
		
		fileName := 'hyperkitty_{1}_{3}_{4}.mbox.gz' format:
			{listName. mailDomain. startString. endString}.
		mboxUrl := '{1}list/{3}@{2}/export/{3}@{2}.mbox.gz?start={4}&end={5}' format:
			{baseUrl. mailDomain. listName. startString. endString}.
		
		self downloadMessagesIn: fileName from: mboxUrl into: directory].
	
	'Downloading...' displayProgressFrom: 0 to: (allChunkDays detectSum: [:chunkDays | chunkDays size - 1]) during: [:bar |
		| count |
		count := 0.
		allChunkDays do: [:chunkDays |
			chunkDays overlappingPairsDo: [:startDay :endDay |
				| chunks |
				bar value: count.
				count := count + 1.
				
				chunks := {startDay to: endDay}.
				(self excludedDaysFor: listName) sorted do: [:excludedDay |
					chunks := chunks gather: [:chunk |
						(chunk includes: excludedDay)
							ifFalse: [{chunk}]
							ifTrue: [{chunk start to: excludedDay - 1 day. excludedDay + 1 day to: chunk end}]]].
				chunks do: [:chunk |
					downloadChunk value: chunk start value: chunk end]]]].