normalization - support
rulesForAuthorFullNameClarification
	"Maps the author key to the author's actual name."
	
	^  rulesForAuthorFullNameClarification ifNil: [rulesForAuthorFullNameClarification := Dictionary newFrom: {
 			'mailmancommits'->'<commits>' . 
			'mailmanother'->'<commits>' . 
			'zarroboogsperchild'->'<commits>' . 
			
			'antonio' -> 'Antonio Moreno'.
			'aaronreichow' -> 'Aaron J. Reichow'.

			'bradallenfuller' -> 'Brad Fuller'.
			'bruceoneel'->'Bruce O''Neel' . 
			'blakewatson'->'Blake Watson' . 

			'chrismuller' -> 'Chris Muller'.

			'dreyfusspierreandreedu' -> 'Pierre-André Dreyfuss' . 
			'davidtlewis' -> 'David T. Lewis' . 
			'dougway' -> 'Doug Way'.
			'danielvainsencher' -> 'Daniel Vainsencher'.
			'damiencassou' -> 'Damien Cassou'.

			'eliotmiranda' -> 'Eliot Miranda'.
			'edgarjdecleene' -> 'Edgar J. De Cleene'.
			
			'frederikvandendriessche' -> 'Frederik Vandendriessche'. 

			'gettimothy'->'Timothy M.' . 
			'goerankrampe' -> 'Göran Krampe'.
			'germansarduino' -> 'Germán S. Arduino'.

			'hanneshirzel' -> 'Hannes Hirzel'.
			'hansmartinmosner' -> 'Hans-Martin Mosner'.
			'henrikgedenryd' -> 'Henrik Gedenryd'.

			'jankomivsek' -> 'Janko Mivsek'.
			'johnmmcintosh'->'John M. McIntosh' . 
			'juanmanuelvuletich'->'Juan M. Vuletich'.
			'jecelassumpcaojr' -> 'Jecel Assumpcao Jr.'.
			'jj' -> 'Jason'. "???"
			
			'karlramberg' -> 'Karl Ramberg'.
			'keithhodges' -> 'Keith Hodges'.
			'kendickey' -> 'Ken Dickey'.

			'leventeuzonyi' -> 'Levente Uzonyi'.
			'lucianonotarfrancesco'->'Luciano E. Notarfrancesco' . 

			'marceltaeumel' -> 'Marcel Taeumel'.
			'michaelhaupt' -> 'Michael Haupt'.
			'michaelrueger' -> 'Michael Rüger'.
			'nick'->'Nick' . 
			
			'orionxelenzil'->'Orion Elenzil' . 
			'offrayvladimirlunacardenas'->'Offray V. L. Cardenas' . 

			'philb'->'Phil B.' . 
			'richardaokeefe' -> 'Richard A. O''Keefe'.
			
			'stephaneducasse' -> 'Stéphane Ducasse'.
			'stephanerollandin' -> 'Stéphane Rollandin'.
			'stephenpair' -> 'Stephen Pair'.
			
			'timrowledge' -> 'Tim Rowledge'.
			'tobiaspape' -> 'Tobias Pape'.

		}]