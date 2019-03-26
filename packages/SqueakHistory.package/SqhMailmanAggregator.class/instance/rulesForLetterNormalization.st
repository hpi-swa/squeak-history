normalization - support
rulesForLetterNormalization

	^ {
		'ö' -> 'oe'.
		'ä' -> 'ae'.
		'ü' -> 'ue'.
		263 asCharacter asString -> 'c'.
		269 asCharacter asString -> 'c'.	
		225 asCharacter asString -> 'a'.
		253 asCharacter asString -> 'y'.	
		235 asCharacter asString -> 'e'.			
		233 asCharacter asString -> 'e'.					
		237 asCharacter asString -> 'i'.				
		353 asCharacter asString -> 's'.						
		345 asCharacter asString -> 'r'.									
		382 asCharacter asString -> 'z'.
	}