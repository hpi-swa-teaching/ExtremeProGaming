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
		'colorBarSelector',
		'cost',
		'perTechnicalDebt',
		'frontend',
		'effect'
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
	#'squeak_changestamp' : 'HCH 6/3/2024 09:54'
}
EPGCard >> beBackend [

	self frontend: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:54'
}
EPGCard >> beFrontend [

	self frontend: true.
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
	#'squeak_changestamp' : 'HCH 6/3/2024 10:27'
}
EPGCard >> bodyOrigin [

	^ (0 @ (self colorBar height + self header height)).
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
	#'squeak_changestamp' : 'HCH 6/3/2024 16:24'
}
EPGCard >> consequence: aText [

	| textMorph |
	textMorph := self formatTask: aText.
	self backBody addMorph: textMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:49'
}
EPGCard >> cost [

	^ cost.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:49'
}
EPGCard >> cost: aNumber [

	cost :=  aNumber.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:57'
}
EPGCard >> displayCost [

	| display |
	self isFrontend
		ifTrue: [display := EPGCostDisplay newFrontendWithCost: self cost perTechnicalDebt: self perTechnicalDebt]
		ifFalse: [display := EPGCostDisplay newBackendWithCost: self cost perTechnicalDebt: self perTechnicalDebt].
	display center: ((self width / 2)@30 )+ self subHeaderOrigin.
	self frontBody addMorph: display.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/3/2024 10:04'
}
EPGCard >> displayEffect [

	| arrow |
	arrow := ImageMorph new.
	self effect = #positive
		ifTrue: [arrow image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/ArrowUp.png') scaledToSize: 60@60)].
	self effect = #negative
		ifTrue: [arrow image:( ((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/ArrowDown.png') scaledToSize: 60@60)].
	arrow center: self bodyOrigin + (self width / 2@110).
	self frontBody addMorph: arrow.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:59'
}
EPGCard >> effect [

	^ effect
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:24'
}
EPGCard >> effect: aText [

	| textMorph |
	textMorph := self formatTask: aText.
	textMorph position:  (0@(self height - textMorph height - self bodyOrigin y)).
	self backBody addMorph: textMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 10:37'
}
EPGCard >> effectSelector [

	^ effect.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 10:37'
}
EPGCard >> effectSelector: aSelector [

	effect := aSelector.
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
	#'squeak_changestamp' : 'HCH 6/3/2024 16:32'
}
EPGCard >> formatAsTextMorph: aText [

	| formattedText |
	formattedText := aText asText addAttribute: self class headerFont.
	^ TextMorph new
		contents: formattedText;
		vResizing: #rigid;
		hResizing: #shrinkWrap;
		width: self width;
		height: 50;
		center: self headerTextCenter;
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
	#'squeak_changestamp' : 'HCH 6/3/2024 09:53'
}
EPGCard >> frontend [

	^ frontend.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:53'
}
EPGCard >> frontend: aBoolean [

	frontend := aBoolean.
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
	#'squeak_changestamp' : 'HCH 6/3/2024 16:36'
}
EPGCard >> headerSymbol: aMorph [

	self header addMorph: (aMorph center: self headerSymbolCenter).

	
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:36'
}
EPGCard >> headerSymbolCenter [

	^ self subclassResponsibility.

	
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:33'
}
EPGCard >> headerTextCenter [

	^ self subclassResponsibility.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/3/2024 10:21'
}
EPGCard >> initialize [

	super initialize.
	
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
	#'squeak_changestamp' : 'HCH 6/3/2024 09:54'
}
EPGCard >> isBackend [

	^ self frontend not.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:54'
}
EPGCard >> isFrontend [

	^ self frontend.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:49'
}
EPGCard >> perTechnicalDebt [

	^ perTechnicalDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:49'
}
EPGCard >> perTechnicalDebt: aNumber [

	perTechnicalDebt :=  aNumber.
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
