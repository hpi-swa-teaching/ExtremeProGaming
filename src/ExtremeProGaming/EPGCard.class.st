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
	#'squeak_changestamp' : 'HCH 5/30/2024 14:02'
}
EPGCard class >> headerFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'DejaVu' size: 30).

	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/30/2024 13:55'
}
EPGCard class >> headerSymbol [

	^ Morph new extent: 20@20; color: Color yellow.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/31/2024 12:14'
}
EPGCard class >> taskFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'DejaVu' size: 20).

	
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/31/2024 12:04'
}
EPGCard >> bodyOrigin [

	^ self colorBar bounds origin + (0 @ self colorBar height).
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 5/31/2024 12:04'
}
EPGCard >> changeBody: aMorph [

	self body ifNotNil: [self removeMorph: self body].
	self body: aMorph.
	aMorph position: self bodyOrigin.
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
	#category : #body,
	#'squeak_changestamp' : 'HCH 5/31/2024 12:31'
}
EPGCard >> consequence: aText [

	| textMorph |
	textMorph := self formatTask: aText.
	self backBody addMorph: textMorph.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 5/31/2024 12:29'
}
EPGCard >> effect: aText [

	| textMorph |
	textMorph := self formatTask: aText.
	textMorph position: 
		self bounds origin 
		+ (0@(self height - textMorph height - 10)) 
		- self bodyOrigin.
	self backBody addMorph: textMorph.
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
	#'squeak_changestamp' : 'HCH 5/31/2024 11:31'
}
EPGCard >> formatAsTextMorph: aText [

	| formattedText |
	formattedText := aText asText addAttribute: self class headerFont.
	^ TextMorph new
		contents: formattedText;
		vResizing: #rigid;
		hResizing: #shrinkWrap;
		width: self extent x;
		height: 50;
		yourself.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 5/31/2024 12:21'
}
EPGCard >> formatTask: aText [

	| formattedText |
	formattedText := (aText asText addAttribute: self class taskFont) addAttribute: TextEmphasis italic.
	^ TextMorph new
		contents: formattedText;
		hResizing: #rigid;
		vResizing: #shrinkWrap;
		width: self width;
		margins: 10@10;
		lock;
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
	#'squeak_changestamp' : 'HCH 5/30/2024 14:01'
}
EPGCard >> headerSymbol: aMorph [

	self header addMorph: (aMorph center: self headerSymbolPosition).

	
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 5/30/2024 14:01'
}
EPGCard >> headerSymbolPosition [

	^ self header center + (30 @ 0).

	
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 5/31/2024 11:32'
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
	#'squeak_changestamp' : 'HCH 5/31/2024 12:30'
}
EPGCard >> initialize [

	super initialize.
	self 
		color: Color white;
		extent: 270 @ 405;
		initializeHeader: 'Dummy';
		colorBar: Color green withLayout: #full;
		frontBody: (Morph new color: Color transparent);
		backBody: (Morph new color: Color transparent);
		task: 'Rewrite in Rust';
		consequence: 'Two of your team members commited suicide beacuase they had to work with COBOL.';
		effect: 'You permanently have 6 Storypoints less';
		changeBody: frontBody;
		facing: #front.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/30/2024 14:01'
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
	 	headerText: aText;
		headerSymbol: self class headerSymbol.
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
	#'squeak_changestamp' : 'HCH 5/31/2024 12:29'
}
EPGCard >> task: aText [

	| textMorph |
	textMorph := self formatTask: aText.
	textMorph position: 
		self bounds origin 
		+ (0@(self height - textMorph height - 10)) 
		- self bodyOrigin.
	self frontBody addMorph: textMorph.
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
