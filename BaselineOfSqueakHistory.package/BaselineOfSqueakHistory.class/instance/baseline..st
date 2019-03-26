as yet unclassified
baseline: spec
	"Squeak 5.2 and above."
	<baseline>
	
	spec for: #common do: [
		spec package: 'SqueakHistory' with: [
			spec
				preLoadDoIt: #checkSista;
				postLoadDoIt: #loadData].
		spec group: 'default' with: #('SqueakHistory')].