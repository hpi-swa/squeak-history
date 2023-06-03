accessing - domain
bodyText
	"Answer the raw body text of the mail. This may be the contents from a MIMEDocument or similar. May contain multiple versions of the text or formatting artifacts."

	self deprecated: 'ct: This is historical and may answers a text that neither reads nice to humans nor to madchines. Send #plainText or #richText to access the text of the message, or send #rawText to access the original source of the message.'.
	^ self valueOfProperty: #bodyText ifAbsentPut: [
		"apparently all kinds of mail sources occasionally mess up encoding"
		self decode: self mailMessage bodyText]