instance creation
from: mailMessage

	^ self new
		fileName: (mailMessage fields at: 'squeak-file-name');
		fileStart: (mailMessage fields at: 'squeak-file-start');
		fileEnd: (mailMessage fields at: 'squeak-file-end');
		yourself