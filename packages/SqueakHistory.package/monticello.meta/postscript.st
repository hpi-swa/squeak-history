(PackageInfo named: 'SqueakHistory') postscript: '"Migrate existing mail wrappers to new subclass (#17)"
SqhMailWrapper allInstancesDo: [:ea |
	(SqhMailmanAggregator mailTypeFromFileName: ea fileName) = SqhPipermailWrapper ifTrue: [
		 SqhPipermailWrapper adoptInstance: ea]].'!
