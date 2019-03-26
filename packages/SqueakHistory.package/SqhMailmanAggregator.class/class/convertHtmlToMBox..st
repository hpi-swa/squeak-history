preparation
convertHtmlToMBox: htmlContent

	| start end subject author mail date dateSep body messageId |
		
	"1) Find 'subject' "
	start := htmlContent findString: '<h1' startingAt: 1 caseSensitive: false.
	start = 0 ifTrue: [
		start := htmlContent findString: '<h2' startingAt: 1 caseSensitive: false.
		start = 0 ifTrue: [Error signal: 'Cannot find start of subject line!']].
	start := htmlContent findString: '>' startingAt: start+3 caseSensitive: false.
	end := htmlContent findString: '</h1>' startingAt: start+1 caseSensitive: false. 
	end = 0 ifTrue: [
		end := htmlContent findString: '</h2>' startingAt: start+1 caseSensitive: false.
		end = 0 ifTrue: [Error signal: 'Cannot find end of subject line!']].
	subject := (htmlContent copyFrom: start+1 to: end-1) withBlanksTrimmed.
	subject := subject unescapeEntities. "Vivide only"
	
	"2) Find 'from' "
	start := htmlContent findString: '<b>' startingAt: end+5 caseSensitive: false.
	end := htmlContent findString: '</b>' startingAt: start+3 caseSensitive: false.
	author := (htmlContent copyFrom: start+3 to: end-1) withBlanksTrimmed.

	start := htmlContent findString: '<a href' startingAt: end+5 caseSensitive: false.
	start := htmlContent findString: '>' startingAt: start+7 caseSensitive: false.
	end := htmlContent findString: '</a>' startingAt: start+1 caseSensitive: false.
	mail := (htmlContent copyFrom: start+1 to: end-1) withBlanksTrimmed.
	
	"Fix mail in case of bogus html content."
	mail := mail
		copyFrom: (mail findLastOccurrenceOfString: '>' startingAt: 1) + 1
		to: mail size.
	mail := mail unescapeEntities. "Vivide only"
	mail := mail copyWithoutAll: '"'. "&quot;sv04er502&quot; at sneakemail.com" 

	"3) Find 'date' "
	start := htmlContent findString: '<i>' startingAt: end+4 caseSensitive: false.
	end := htmlContent findString: '</i>' startingAt: start+3 caseSensitive: false.
	date := htmlContent copyFrom: start+3 to: end-1.
	(date findTokens: ' ') in: [:tokens | | offset |
		offset := self mapForTimeOffset.
		(tokens first endsWith: ',') 
			ifFalse: [ "Mon Aug 15 18:48:12 CEST 2005"
				date := '{1}, {3} {2} {6} {4} {7}'
					format: tokens, {offset at: tokens fifth asLowercase}.
				dateSep := '{1} {2} {3} {4} {6}'
					format: tokens]
			ifTrue: [ "Sat, 22 Mar 2003 02:42:53 +0100"
				date := '{1} {2} {3} {4} {5} {7}'
					format: tokens, {tokens sixth copyWithoutAll: '+'}.
				dateSep := '{7} {3} {2} {5} {4}'
					format: tokens, {tokens first copyWithoutAll: ','}.
				]].
	
	"4) Find 'body' "
	start := htmlContent findString: '<pre>' startingAt: end+4 caseSensitive: false.
	end := htmlContent findString: '</pre>' startingAt: start+5 caseSensitive: false.
	body := htmlContent copyFrom: start+5 to: end-1.
	body := body unescapeEntities. "Vivide only"
	body := body copyReplaceAll: '<i>' with: ''.
	body := body copyReplaceAll: '</i>' with: ''.
	
	"5) Well ... the message id ..."
	messageId := UUID new asString.
	
	^ 'From {1} {6}\From: {1} ({3})\Date: {2}\Subject: {4}\Message-ID: <{7}>\\{5}' withCRs
		format: {mail. date. author. subject. body. dateSep. messageId}