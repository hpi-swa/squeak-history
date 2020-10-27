as yet unclassified
setMailMessage: mm during: workBlock
	mailMessage := mm.
	[workBlock cull: self]
		ensure: [mailMessage := nil].