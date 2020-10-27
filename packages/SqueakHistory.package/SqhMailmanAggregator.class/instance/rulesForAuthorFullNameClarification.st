normalization - support
rulesForAuthorFullNameClarification
	"Maps the author key to the author's actual name."
	
	^  rulesForAuthorFullNameClarification ifNil: [rulesForAuthorFullNameClarification := Dictionary newFrom: {
 			'mailmancommits'->'<commits>' . 
			'mailmanother'->'<commits>' . 
			'zarroboogsperchild'->'<commits>' . 
			
			'antonio'->'Antonio Moreno' . 

			'bruceoneel'->'Bruce O''Neel' . 
			'blakewatson'->'Blake Watson' . 

			'dreyfusspierreandreedu'->'Pierre-André Dreyfuss' . 
			'davidtlewis'->'Dave Lewis' . 

			'frederikvandendriessche' -> 'Frederik Vandendriessche'. 

			'gettimothy'->'Timothy M.' . 

			'johnmmcintosh'->'John M. McIntosh' . 
			'juanmanuelvuletich'->'Juan M. Vuletich'.
			'lucianonotarfrancesco'->'Luciano E. Notarfrancesco' . 

			'nick'->'Nick' . 
			
			'orionxelenzil'->'Orion Elenzil' . 
			'offrayvladimirlunacardenas'->'Offray V. L. Cardenas' . 

			'philb'->'Phil B.' . 

		}]