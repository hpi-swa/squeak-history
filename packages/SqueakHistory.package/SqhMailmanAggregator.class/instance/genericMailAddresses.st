normalization - support
genericMailAddresses
	"The following list of mail addresses DO NOT identify distinct entities but groups of entities."

	^ #(
		'core.lists.squeak@core-sdi.com'
		'notifications@github.com'
		'noreply@github.com'
		
		'no-reply@appveyor.com'
		'cog@googlecode.com'
		'builds@travis-ci.org'
		
		'squeak-dev@lists.squeakfoundation.org'
		'squeak-dev.sourcery@forum-mail.net'
		'squeakland-forum@squeakland.org'
		'etoys-dev-forum@squeakland.org'
		'commits@etoys.squeak.org'
		
		'mailer-daemon@unibe.ch' 
		
		'error@doesnotexist.foo' "See #normalizeMailAddress:"
	)