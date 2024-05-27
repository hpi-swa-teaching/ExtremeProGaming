Class {
	#name : #EPGCard,
	#superclass : #EPGDnDMorph,
	#instVars : [
		'frontBody',
		'backBody',
		'header',
		'colorBar',
		'colorBarSelector'
	],
	#category : #ExtremeProGaming
}

{
	#category : #areas,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:56'
}
EPGCard >> addColorBar: aColor [

	| bar |
	bar := Morph new
		color: aColor.
	 (self colorBarSelector == #full)
		ifTrue: [bar 
					extent: self extent x @ 30;
					position: self subHeaderOrigin.].
	(self colorBarSelector == #left)
		ifTrue: [bar
					extent: (self extent x / 2) @ 30;
					position: self subHeaderOrigin].
	(self colorBarSelector == #right)
		ifTrue: [bar
					extent: (self extent x / 2) @ 30;
					position: self subHeaderOrigin + (bar width @ 0)].
	self addMorph: bar.
	self colorBar: bar.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:56'
}
EPGCard >> colorBar [

	^ colorBar.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:56'
}
EPGCard >> colorBar: aMorph [

	colorBar := aMorph.
]

{
	#category : #areas,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:57'
}
EPGCard >> colorBar: aColor withLayout: aLayoutSelector [

	self colorBar ifNotNil: [self removeMorph: self colorBar].
	self colorBarSelector: aLayoutSelector.
	self addColorBar: aColor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:21'
}
EPGCard >> colorBarSelector [

	^ colorBarSelector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:22'
}
EPGCard >> colorBarSelector: aSelector [

	colorBarSelector := aSelector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:30'
}
EPGCard >> header [

	^ header.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:30'
}
EPGCard >> header: aMorph [

	header := aMorph.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/27/2024 21:10'
}
EPGCard >> initialize [

	super initialize.
	self 
		color: Color white;
		extent: 250 @ 417;
		initializeHeader: 'Dummy';
		colorBar: Color green withLayout: #full.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:34'
}
EPGCard >> initializeHeader: aText [

	| header textMorph |
	header := Morph new
		extent: self extent x @ 30;
		color: Color transparent;
		position:  0@0.
	self addMorph: header.
	self header: header.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:29'
}
EPGCard >> subHeaderOrigin [

	^ self header bounds origin + (0 @ self header height).
]
