as yet unclassified
asColor

	| hue sat |
	hue := (self fullName first asInteger - $A asInteger + 1 * (360 / 26)).
	sat := 1.0 - ((self fullName last asUppercase asInteger - $A asInteger) / 26).

	^ Color
		h: hue
		s: (sat + 0.3 min: 1.0)
		v: 1.0