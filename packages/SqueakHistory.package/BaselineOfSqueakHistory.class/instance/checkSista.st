as yet unclassified
checkSista

	(Smalltalk classNamed: #EncoderForSistaV1)
		ifNil: [Warning signal: 'This environment does not support the SistaV1 Bytecode Set! Method loading might fail if proceeded.' withCRs]
		ifNotNil: [:sistaBytecodeSet |
			CompiledCode preferredBytecodeSetEncoderClass ~~ sistaBytecodeSet ifTrue: [
				Warning signal: 'The support for the SistaV1 Bytecode Set needs to be activated. Make sure to use the correct VM, too. Until then, method loading might fail if proceeded.']].