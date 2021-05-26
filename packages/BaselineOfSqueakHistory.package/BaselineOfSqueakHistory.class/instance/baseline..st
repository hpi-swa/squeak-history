baseline
baseline: spec
	"Squeak 5.2 and above."
	<baseline>
	
	spec for: #common do: [
		spec package: 'SqueakHistory' with: [
			spec
				preLoadDoIt: #checkSista].
		spec package: 'SqueakHistoryData' with: [
			spec
				requires: 'SqueakHistory';
				postLoadDoIt: #loadData].
		spec group: 'default' with: #('SqueakHistoryData')].