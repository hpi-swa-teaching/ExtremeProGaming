Class {
	#name : #EPGCard,
	#superclass : #EPGDnDMorph,
	#instVars : [
		'facing',
		'body',
		'frontBody',
		'backBody',
		'header',
		'colorBar',
		'colorBarSelector'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:28'
}
EPGCard class >> headerFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'DejaVu' size: 42).

	
]

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
	#'squeak_changestamp' : 'HCH 5/29/2024 20:47'
}
EPGCard >> backBody [

	^ backBody.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:47'
}
EPGCard >> backBody: aMorph [

	backBody := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:57'
}
EPGCard >> body [

	^ body.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:52'
}
EPGCard >> body: aMorph [

	body := aMorph

]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:55'
}
EPGCard >> changeBody: aMorph [

	self body ifNotNil: [self removeMorph: self body].
	self body: aMorph.
	aMorph position: self subColorBarOrigin.
	self addMorph: self body.
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
	#'squeak_changestamp' : 'HCH 5/29/2024 20:46'
}
EPGCard >> facing [

	^ facing.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:46'
}
EPGCard >> facing: aSelector [

	facing := aSelector.
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:27'
}
EPGCard >> formatAsTextMorph: aText [

	| formattedText |
	formattedText := aText asText addAttribute: self class headerFont.
	^ TextMorph new
		contents: formattedText;
		vResizing: #rigid;
		hResizing: #rigid;
		centered;
		width: self extent x;
		height: 50;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:47'
}
EPGCard >> frontBody [

	^ frontBody.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:47'
}
EPGCard >> frontBody: aMorph [

	frontBody := aMorph.
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
	#category : #header,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:33'
}
EPGCard >> headerText: aText [
	
	|textMorph|
	self header submorphsDo: [:sub | self header removeMorph: sub].
	textMorph := self formatAsTextMorph: aText.
	textMorph lock.
	self header addMorph: textMorph.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:59'
}
EPGCard >> initialize [

	super initialize.
	self 
		color: Color white;
		extent: 250 @ 417;
		initializeHeader: 'Dummy';
		colorBar: Color green withLayout: #full;
		frontBody: (Morph new color: Color blue);
		backBody: (Morph new color: Color green);
		changeBody: frontBody;
		facing: #front.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:34'
}
EPGCard >> initializeHeader: aText [

	| header |
	header := Morph new
		extent: self extent x @ 50;
		color: Color transparent;
		position:  0@0.
	self
		addMorph: header;
	 	header: header;
	 	headerText: aText.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 20:50'
}
EPGCard >> subColorBarOrigin [

	^ self colorBar bounds origin + (0 @ self colorBar height).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:29'
}
EPGCard >> subHeaderOrigin [

	^ self header bounds origin + (0 @ self header height).
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:04'
}
EPGCard >> turn [

	self facing = #front
		ifTrue: [self facing: #back. self changeBody: self backBody. ^ self].
	self facing = #back
		ifTrue: [self facing: #front. self changeBody: self frontBody. ^ self].
]
