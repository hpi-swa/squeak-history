normalization - support
rulesForAuthorKeyNormalization
	"RulesForAuthorKeyNormalizationDerived := nil."
	^ rulesForAuthorKeyNormalization ifNil: [rulesForAuthorKeyNormalization := Dictionary newFrom: {
		'alanckay' -> 'alancurtiskay'.
		'alankay' -> 'alancurtiskay'.
		'analgrimes' -> 'alangrimes'.
		'akgrant' -> 'alistairgrant'.
		
		'aaron' -> 'aaronreichow'.
		'blake' -> 'blakewatson'.
		
		'bertfreudenbergg' -> 'vanessafreudenberg'.
		'bertfreudenberg' -> 'vanessafreudenberg'.

		'chrismullerchris' -> 'chrismuller'.
		'chrismullerviagoogledrive' -> 'chrismuller'.

		'cdegroot' -> 'ceesdegroot'.
		'charleshixson' -> 'charlesdhixson'.
		'ronaldspengler' -> 'caseyransberger'.

		'dalekhenrichs' -> 'dalehenrichs'.
		'danielv' -> 'danielvainsencher'.
		'davidnsmithibm' -> 'davidnsmith'.
		'diogenesalbertomoreira' -> 'diogenesmoreira'.

		'dralexanderklein' -> 'alexanderklein'.

		'edgardecleene' -> 'edgarjdecleene'.
		'edgar' -> 'edgarjdecleene'. "!!! may be ambiguous for other data set !!!"
		'edgardecatgmailcom' -> 'edgarjdecleene'.
		'edgardec2001' -> 'edgarjdecleene'.
		'licedgarjdecleene' -> 'edgarjdecleene'.

		'eliotlinda' -> 'eliotmiranda'.
		'eliotlindamiranda' -> 'eliotmiranda'.

		'elodkironsky' -> 'eloedkironsky'.
		'florin' -> 'florinmateoc'.
		'florinxmateoc' -> 'florinmateoc'.
		'franciscogarau' -> 'franciscojgarau'.
		'friedrich' -> 'friedrichdominicus'.
		'fredfrederikvandendriessche' -> 'frederikvandendriessche'.
		'gerardorichartecoresdi' -> 'gerardoricharte'.
		'germanarduino' -> 'germansarduino'.
		'giuseppeluigipunziruiz' -> 'giuseppeluigipunzi'.
		
		'gorankrampe' -> 'goerankrampe'.
		'goeranhultgren' -> 'goerankrampe'.
		'goranhultgren' -> 'goerankrampe'.
		
		'hanneshirzelsqueaklist' -> 'hanneshirzel'.
		'hhirzel' -> 'hanneshirzel'.

		'hansmartinmosnerhmm' -> 'hansmartinmosner'.
		'hmm' -> 'hansmartinmosner'.

		'johnmmcintoshold' -> 'johnmmcintosh'.
		'johnmci' -> 'johnmmcintosh'.
		'johnmcintosh' -> 'johnmmcintosh'.
		'johnm' -> 'johnmaloney'.
		'johnreedmaffeorlpa' -> 'johnreedmaffeo'.
		'johnreedxmaffeo' -> 'johnreedmaffeo'.
		'jrmaffeo' -> 'johnreedmaffeo'.
		
		'joselredrejo' ->  'joseluisredrejorodriguez'.
		'joselredrejorodriguez' ->  'joseluisredrejorodriguez'.
		'joseluisredrejo' ->  'joseluisredrejorodriguez'.
		
		'vuletich' -> 'juanmanuelvuletich'.

		'deepcovelabsyvrjoergbeekmann' -> 'joergbeekmann'.
		'deepcovelabsjoergbeekmann' -> 'joergbeekmann'.

		'karl' -> 'karlramberg'. "!!! may be ambiguous for other data set !!!"
		'kharnessatillinoisedu' -> 'kathleenharness'.
		'kengbrownw' -> 'kengbrown'.
		'kevingfisher' -> 'kevinfisher'.
		'kksubramaniam' -> 'kksubbu'.
		'subbukk' -> 'kksubbu'.
		'klauswitzel' -> 'klausdwitzel'.
		
		'laurencerozieriii' -> 'laurencerozier'.
		'leandro' -> 'leandrocaniglia'.
		'lenglish' -> 'lawsonenglish'.
		'leodemarcosmalltalking' -> 'leodemarco'.

		'lucianoestebannotarfrancesco' -> 'lucianonotarfrancesco'.
	
		'mikeklein' -> 'michaelklein'.
		
		'niccokunzmannrambler' -> 'niccokunzmann'.
		
		'petervanrooijensqueakdev' -> 'petervanrooijen'.		
		'philippebackhighoctane' -> 'philippeback'.
		'philathighoctanebe' -> 'philippeback'.

		'dreyfusspierreandreedu' -> 'pierreandredreyfuss'.
		'padreyfussatexcitecom' -> 'pierreandredreyfuss'.
		
		'ralphjohnson' -> 'ralphejohnson'.
		'randalschwartz' -> 'randallschwartz'.
		'ritaatisgcsunimagdeburgde' -> 'ritafreudenberg'.

		'robwithers' -> 'robertwithers'.
		'scottw' -> 'scottwallace'.

		'stephaneducassehome' -> 'stephaneducasse'.
		'stephaneducasseh' -> 'stephaneducasse'.
		'ducasse' -> 'stephaneducasse'.

		'sungijnchun' -> 'sungjinchun'.
		'committeeonsenselessmethodaddition' -> 'stephenpair'.

		'timothyrowledge' -> 'timrowledge'.
		'tedk' -> 'tedkaehler'.

		'todblanchard' -> 'toddbalnchard'.
		'tonyg' -> 'tonygarnockjones'.

		"auto/generic stuff"
		'commits' -> 'mailmancommits'.
		'commitsatsourcesqueakorg' -> 'mailmancommits'.
		'commitsatsqueakvmorg' -> 'mailmancommits'.
		'commitsatetoyssqueakorg' -> 'mailmancommits'.
		
		'zarroboogsperchild' -> 'bugtracker'. "for laptop.org"
		
		"'squeakdev' -> 'mailmanother'." "See alanreider in authory-key clarification."
		'squeakdevnoreply' -> 'mailmanother'. "mailmancommits ???"
		'squeakdevnoreplyatlistssqueakfoundationorg' -> 'mailmanother'. "mailmancommits ???"
		'mailerdeamon' -> 'mailmanother'. "???"
		'squeakdevpris' -> 'mailmanspam'.

		"other stuff"
		'unknown' -> 'unkownauthor'.
	}]