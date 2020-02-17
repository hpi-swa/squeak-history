accessing - convenience
mails

	^ DemoHome mailboxes gather: [:box |
		box mailsFrom: self]