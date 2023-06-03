preparation
downloadList: listName fromHyperkitty: spec forTimespans: timespans into: directory

	| baseUrl mailDomain exclusiveEnd allChunkDays |
	baseUrl := spec first.
	mailDomain := spec second.
	
	"Download messages in chunks to enable progress updates (during downloading and later enumeration). Overhead per chunk download is approx. 150 ms (Windows 10, 40 mbit/s down, 10 mbit/s up, ping 25ms)."
	allChunkDays := timespans collect: [:timespan |
		exclusiveEnd := timespan end asDate +
			(timespan end asTime > Time midnight) asBit days "url end parameter is exclusive".
		"todo: check again for non-midnight timespans"
		Array streamContents: [:stream |
			timespan every: 7 days do: [:date |
				stream nextPut: date].
			exclusiveEnd - stream peekLast > 1 nanoSecond ifTrue:
				[stream nextPut: exclusiveEnd]]].
	
	'Downloading...' displayProgressFrom: 0 to: (allChunkDays detectSum: [:chunkDays | chunkDays size - 1]) during: [:bar |
		| count |
		count := 0.
		allChunkDays do: [:chunkDays |
			chunkDays overlappingPairsDo: [:startDay :endDay |
				| startString endString fileName mboxUrl |
				bar value: count.
				count := count + 1.
				startString := startDay asDate yyyymmdd.
				endString := endDay asDate yyyymmdd.
				
				fileName := 'hyperkitty_{1}_{3}_{4}.mbox.gz' format:
					{listName. mailDomain. startString. endString}.
				mboxUrl := '{1}list/{3}@{2}/export/{3}@{2}.mbox.gz?start={4}&end={5}' format:
					{baseUrl. mailDomain. listName. startString. endString}.
				
				self downloadMessagesIn: fileName from: mboxUrl into: directory]]].