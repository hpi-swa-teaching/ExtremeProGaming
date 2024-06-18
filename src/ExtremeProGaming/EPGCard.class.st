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
		'effect',
		'gameBoard',
		'focus',
		'game'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:59'
}
EPGCard class >> backendColor [

	^ Color fromString: '#5f4dfa'.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JP 6/13/2024 23:14'
}
EPGCard class >> cardExtent [

	^ 200 @ 300.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:43'
}
EPGCard class >> colorBarHeight [

	^ 22.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/3/2024 17:29'
}
EPGCard class >> frontendColor [

	^ Color fromString: '#fc5d5d'.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:36'
}
EPGCard class >> headerFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 28).

	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:02'
}
EPGCard class >> headerSymbol [

	^ Morph new extent: 20 @ 20; color: Color yellow.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 6/18/2024 10:15'
}
EPGCard class >> taskBackFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 45).

	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 6/18/2024 10:15'
}
EPGCard class >> taskFrontFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 15).

	
]

{
	#category : #bar,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:42'
}
EPGCard >> addColorBar: aColor [

	| bar |
	bar := Morph new
		color: aColor.
	 (self colorBarSelector == #full)
		ifTrue: [bar 
					extent: self extent x @ self class colorBarHeight;
					position: self subHeaderOrigin.].
	(self colorBarSelector == #left)
		ifTrue: [bar
					extent: (self extent x / 2) @ self class colorBarHeight;
					position: self subHeaderOrigin].
	(self colorBarSelector == #right)
		ifTrue: [bar
					extent: (self extent x / 2) @ self class colorBarHeight;
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
	#'squeak_changestamp' : 'sv 6/16/2024 08:37'
}
EPGCard >> beFocus [

	focus := true.
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
	#'squeak_changestamp' : 'sv 6/17/2024 16:39'
}
EPGCard >> beFrozen [

	self frozen: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 17:03'
}
EPGCard >> beNegative [

	self effectSelector: #negative.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 17:03'
}
EPGCard >> bePositive [

	self effectSelector: #positive.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/16/2024 08:37'
}
EPGCard >> beUnfocus [

	focus := false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/17/2024 16:40'
}
EPGCard >> beUnfrozen [

	self frozen: false.
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
	#'squeak_changestamp' : 'HCH 6/6/2024 20:02'
}
EPGCard >> body: aMorph [

	body := aMorph.

]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:53'
}
EPGCard >> bodyOrigin [

	^ self bounds origin + (0 @ (self colorBar height + self header height)).
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
	#category : #bar,
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
	#'squeak_changestamp' : 'sv 6/18/2024 10:19'
}
EPGCard >> consequence: aText [

	| textMorph |
	textMorph := self formatBackTask: aText.
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
	#'squeak_changestamp' : 'HCH 6/3/2024 17:02'
}
EPGCard >> cost: aCost perTechnicalDebt: aNumber [

	self 
		cost: aCost;
		perTechnicalDebt: aNumber;
		displayCost.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:44'
}
EPGCard >> displayCost [

	| display |
	self isFrontend
		ifTrue: [display := EPGCostDisplay newFrontendWithCost: self cost perTechnicalDebt: self perTechnicalDebt]
		ifFalse: [display := EPGCostDisplay newBackendWithCost: self cost perTechnicalDebt: self perTechnicalDebt].
	display center: ((self width / 2)@ 5)+ self subHeaderOrigin.
	self frontBody addMorph: display.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:44'
}
EPGCard >> displayEffect [

	| arrow |
	arrow := ImageMorph new.
	self effect = #positive
		ifTrue: [arrow image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/ArrowUp.png') scaledToSize: self effectSize)].
	self effect = #negative
		ifTrue: [arrow image:( ((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/ArrowDown.png') scaledToSize: self effectSize)].
	arrow center: self bodyOrigin + (self width / 2 @ 50).
	self frontBody addMorph: arrow.
]

{
	#category : #'mouse events',
	#'squeak_changestamp' : 'sv 6/18/2024 11:13'
}
EPGCard >> doubleClick: anEvent [

	self isFocus 
		ifTrue: [self toggleFocusCard.].
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:03'
}
EPGCard >> effect [

	^ effect.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 6/18/2024 10:43'
}
EPGCard >> effect: aText [

	| textMorph |
	textMorph := self formatBackTask: aText.
	textMorph position:  (0 @ (self height * 3 - textMorph height - self bodyOrigin y)).
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
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:21'
}
EPGCard >> effectSize [

	^ self width / 6. 
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
	#'squeak_changestamp' : 'sv 6/18/2024 10:19'
}
EPGCard >> formatBackTask: aText [

	| formattedText |
	formattedText := (aText asText addAttribute: self class taskBackFont) addAttribute: TextEmphasis italic.
	^ TextMorph new
		contents: formattedText;
		hResizing: #rigid;
		vResizing: #shrinkWrap;
		width: self width;
		margins: 10 @ 10;
		lock;
		yourself.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 6/18/2024 10:19'
}
EPGCard >> formatFrontTask: aText [

	| formattedText |
	formattedText := (aText asText addAttribute: self class taskFrontFont) addAttribute: TextEmphasis italic.
	^ TextMorph new
		contents: formattedText;
		hResizing: #rigid;
		vResizing: #shrinkWrap;
		width: self width;
		margins: 10 @ 10;
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
	#'squeak_changestamp' : 'sv 6/17/2024 16:39'
}
EPGCard >> frozen: aBoolean [

	frozen := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/17/2024 15:28'
}
EPGCard >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/17/2024 15:28'
}
EPGCard >> game: anEPGGame [

	game := anEPGGame.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:30'
}
EPGCard >> gameBoard [

	^ gameBoard.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:30'
}
EPGCard >> gameBoard: aGameBoard [

	gameBoard := aGameBoard.
]

{
	#category : #'mouse events',
	#'squeak_changestamp' : 'sv 6/18/2024 11:14'
}
EPGCard >> handlesMouseDown: anEvent [

	^ true.
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
	#category : #header,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:33'
}
EPGCard >> headerTextCenter [

	^ self subclassResponsibility.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 6/18/2024 11:30'
}
EPGCard >> initialize [

	super initialize.
	
	self
		color: Color white;
		extent: EPGCard cardExtent;
		frontBody: (Morph new color: Color transparent);
		backBody: (Morph new color: Color transparent);
		facing: #front;
		beUnfocus;
		beUnfrozen.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:03'
}
EPGCard >> initializeHeader: aText [

	| header |
	header := Morph new
		extent: self extent x @ 50;
		color: Color transparent;
		position:  0 @ 0.
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
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 17:52'
}
EPGCard >> isEPGStorypoint [

	^ false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/16/2024 08:37'
}
EPGCard >> isFocus [

	^ focus.
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
	#'squeak_changestamp' : 'sv 6/17/2024 16:39'
}
EPGCard >> isFrozen [

	^ frozen.
]

{
	#category : #'focus card',
	#'squeak_changestamp' : 'sv 6/18/2024 10:43'
}
EPGCard >> makeFocusSize [

	| positions |
	self extent: self extent * 3.
	positions := OrderedCollection with: (self position)
				with: (self position + self extent y / 2).
	self backBody submorphsDo:
		[:text | 
			| index |
        		index := (self backBody submorphs indexOf: text).
			text extent: text extent * 3
				"position: (positions at: index)".].
]

{
	#category : #'mouse events',
	#'squeak_changestamp' : 'sv 6/18/2024 11:25'
}
EPGCard >> mouseDown: anEvent [ 

	(self gameBoard backlogArea bounds containsPoint: anEvent position)
		ifTrue: [anEvent hand waitForClicksOrDrag: self event: anEvent].
	anEvent wasHandled: false.
	super mouseDown: anEvent
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
	#category : #header,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:29'
}
EPGCard >> subHeaderOrigin [

	^ self header bounds origin + (0 @ self header height).
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 6/18/2024 10:19'
}
EPGCard >> task: aText [

	| textMorph |
	textMorph := self formatFrontTask: aText.
	textMorph position: (0 @ (self height - textMorph height - self bodyOrigin y)).
	self frontBody addMorph: textMorph.
]

{
	#category : #'focus card',
	#'squeak_changestamp' : 'sv 6/18/2024 11:22'
}
EPGCard >> toggleFocusCard [

	(self isFocus)
		ifFalse: [self turn. 
			self gameBoard freezeDnD.
			self makeFocusSize.
			self gameBoard addMorphFront: 
				(self center: self gameBoard boundsInWorld center).
			self beFocus.]
		ifTrue: [self extent: self extent / 3.
			self turn.
			self gameBoard unfreezeDnD.
			self moveToDone.
			self beUnfocus.].
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 6/18/2024 11:07'
}
EPGCard >> turn [

	self facing = #front
		ifTrue: [self facing: #back. self changeBody: self backBody. ^ self].
	self facing = #back
		ifTrue: [self facing: #front. self changeBody: self frontBody. ^ self].
]
