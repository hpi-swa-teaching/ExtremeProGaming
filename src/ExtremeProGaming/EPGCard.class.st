"
This provides a framework for concrete playing cards. It should not be instantiated.
"
Class {
	#name : #EPGCard,
	#superclass : #EPGDnDMorph,
	#instVars : [
		'game',
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
		'gameBoard',
		'focus',
		'effectSelector',
		'effect'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:26'
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
	#'squeak_changestamp' : 'HCH 6/20/2024 20:05'
}
EPGCard class >> backendLayout [

	^ #right.
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
	#category : #'text constants',
	#'squeak_changestamp' : 'sv 7/9/2024 23:07'
}
EPGCard class >> defaultTextMargins [

	^ 10 @ 10.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 22:51'
}
EPGCard class >> displayCostOffset [

	^ (self cardExtent x / 2) @ 5.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 23:00'
}
EPGCard class >> displayEffectSymbolOffset [

	^ (self cardExtent x / 2) @ 50.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 23:00'
}
EPGCard class >> displayEffectTextOffset [

	^ 0 @ self cardExtent y * 3 / 2.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 22:55'
}
EPGCard class >> effectSize [

	^ self cardExtent x / 6. 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/23/2024 13:45'
}
EPGCard class >> eventColor [

	^ Color fromString: '#e6bf7c'.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/23/2024 13:31'
}
EPGCard class >> eventLayout [

	^ #full.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 6/18/2024 13:05'
}
EPGCard class >> focusSclaeFactor [

	^ 3.
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
	#'squeak_changestamp' : 'HCH 6/20/2024 20:05'
}
EPGCard class >> frontendLayout [

	^ #left.
]

{
	#category : #'text constants',
	#'squeak_changestamp' : 'HCH 6/12/2024 14:36'
}
EPGCard class >> headerFont [

 	^ TextFontReference  toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 28).

	
]

{
	#category : #'text constants',
	#'squeak_changestamp' : 'sv 7/9/2024 23:03'
}
EPGCard class >> headerMorphHeight [

	^ 50.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 23:09'
}
EPGCard class >> headerSize [

	^ self cardExtent x @ 50.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:02'
}
EPGCard class >> headerSymbol [

	^ Morph new extent: 20 @ 20; color: Color yellow.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 22:57'
}
EPGCard class >> negativeEffectImage [

	^ ((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/ArrowDown.png')
			scaledToSize: self effectSize.
]

{
	#category : #'appereance constants',
	#'squeak_changestamp' : 'sv 7/9/2024 22:54'
}
EPGCard class >> positiveEffectImage [

	^ ((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/ArrowUp.png')
			scaledToSize: self effectSize.
]

{
	#category : #'text constants',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 12:08'
}
EPGCard class >> taskBackFont [

 	^ TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 45).

	
]

{
	#category : #'text constants',
	#'squeak_changestamp' : 'sv 7/9/2024 23:03'
}
EPGCard class >> taskFrontFont [

 	^ TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 15).
]

{
	#category : #bar,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:34'
}
EPGCard >> addColorBar: aColor [

	| bar |
	bar := Morph new color: aColor.
	self colorBarSelector == #full
		ifTrue: [bar extent: self extent x @ self class colorBarHeight;
				 position: self subHeaderOrigin].
	self colorBarSelector == #left
		ifTrue: [bar extent: self extent x / 2 @ self class colorBarHeight;
				 position: self subHeaderOrigin].
	self colorBarSelector == #right
		ifTrue: [bar extent: self extent x / 2 @ self class colorBarHeight;
				 position: self subHeaderOrigin + (bar width @ 0)].
	self
		addMorph: bar;
		 colorBar: bar.
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
	#'squeak_changestamp' : 'sv 7/9/2024 20:30'
}
EPGCard >> beFocus [

	self focus: true.
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
	#'squeak_changestamp' : 'sv 7/9/2024 20:31'
}
EPGCard >> beUnfocus [

	self focus: false.
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
	#'squeak_changestamp' : 'sv 6/22/2024 14:46'
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
	#'squeak_changestamp' : 'HCH 6/20/2024 01:12'
}
EPGCard >> displayConsequenceText: aText [

	| textMorph |
	textMorph := self formatBackTask: aText.
	self backBody addMorph: textMorph.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/9/2024 22:51'
}
EPGCard >> displayCost [

	| display |
	self isFrontend
		ifTrue: [display := EPGCostDisplay newFrontendWithCost: self cost perTechnicalDebt: self perTechnicalDebt]
		ifFalse: [display := EPGCostDisplay newBackendWithCost: self cost perTechnicalDebt: self perTechnicalDebt].
	display center: self class displayCostOffset + self subHeaderOrigin.
	self frontBody addMorph: display.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/10/2024 09:44'
}
EPGCard >> displayEffect [

	| arrow |
	arrow := ImageMorph new.
	self effectSelector = #positive
		ifTrue: [arrow image: self class positiveEffectImage.]
		ifFalse: [arrow image: self class negativeEffectImage.].
	arrow center: self class displayEffectSymbolOffset + self bodyOrigin.
	self frontBody addMorph: arrow
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/9/2024 23:01'
}
EPGCard >> displayEffectText: aText [

| textMorph |
	textMorph := self formatBackTask: aText.
	self backBody addMorph: textMorph.
	textMorph position: textMorph position + self class displayEffectTextOffset.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/9/2024 23:06'
}
EPGCard >> displayTaskText: aText [

	| textMorph |
	textMorph := self formatFrontTask: aText.
	textMorph position: (0 @ (self height - textMorph height - self bodyOrigin y)).
	self frontBody addMorph: textMorph.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'HCH 6/19/2024 22:43'
}
EPGCard >> doubleClick: anEvent [

	self isFocus 
		ifTrue: [self toggleFocusCard.].
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:04'
}
EPGCard >> effect [

	^ effect.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:04'
}
EPGCard >> effect: anEPGEffect [

	effect := anEPGEffect.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:34'
}
EPGCard >> effectSelector [

	^ effectSelector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:34'
}
EPGCard >> effectSelector: aSelector [

	effectSelector := aSelector.
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
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:29'
}
EPGCard >> focus [

	^ focus.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:29'
}
EPGCard >> focus: aBoolean [

	focus := aBoolean.
]

{
	#category : #header,
	#'squeak_changestamp' : 'sv 7/9/2024 23:03'
}
EPGCard >> formatAsTextMorph: aText [

	| formattedText |
	formattedText := aText asText addAttribute: self class headerFont.
	^ TextMorph new
		contents: formattedText;
		vResizing: #rigid;
		hResizing: #shrinkWrap;
		width: self width;
		height: self class headerMorphHeight;
		center: self  class headerTextCenter;
		yourself.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/9/2024 23:08'
}
EPGCard >> formatBackTask: aText [

	| formattedText |
	formattedText := (aText asText addAttribute: self class taskBackFont) addAttribute: TextEmphasis italic.
	^ TextMorph new
		contents: formattedText;
		hResizing: #rigid;
		vResizing: #shrinkWrap;
		width: self width;
		margins: self class defaultTextMargins;
		lock;
		yourself.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/9/2024 23:08'
}
EPGCard >> formatFrontTask: aText [

	| formattedText |
	formattedText := (aText asText addAttribute: self class taskFrontFont) addAttribute: TextEmphasis italic.
	^ TextMorph new
		contents: formattedText;
		hResizing: #rigid;
		vResizing: #shrinkWrap;
		width: self width;
		margins: self class defaultTextMargins;
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
	#category : #'event handling',
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
	#'squeak_changestamp' : 'sv 7/9/2024 22:35'
}
EPGCard >> headerSymbol: aMorph [

	self header addMorph: (aMorph center: self header center + self class headerSymbolOffset).

	
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
	#'squeak_changestamp' : 'sv 7/9/2024 22:44'
}
EPGCard >> initialize [

	super initialize.
	
	self
		color: Color white;
		extent: self class cardExtent;
		frontBody: (Morph new color: Color transparent);
		backBody: (Morph new color: Color transparent);
		facing: #front;
		beUnfocus.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:35'
}
EPGCard >> initializeHeader: aText [

	| newHeader |
	newHeader := Morph new
		extent: self class headerSize;
		color: Color transparent.
	self
		addMorph: newHeader;
	 	header: newHeader;
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
	#'squeak_changestamp' : 'sv 7/9/2024 20:32'
}
EPGCard >> isFocus [

	^ self focus.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 09:54'
}
EPGCard >> isFrontend [

	^ self frontend.
]

{
	#category : #'focus card',
	#'squeak_changestamp' : 'sv 6/18/2024 13:05'
}
EPGCard >> makeFocusSize [

	self extent: self extent * self class focusSclaeFactor.
	self backBody submorphsDo:
		[:text | text extent: text extent * self class focusSclaeFactor.].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'sv 6/18/2024 13:05'
}
EPGCard >> mouseDown: anEvent [ 

	(self gameBoard backlogArea bounds containsPoint: anEvent position)
		ifTrue: [anEvent hand waitForClicksOrDrag: self event: anEvent].
	anEvent wasHandled: false.
	super mouseDown: anEvent.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'sv 7/9/2024 19:10'
}
EPGCard >> moveToDone [

	^ self subclassResponsibility.
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
	#category : #'focus card',
	#'squeak_changestamp' : 'sv 6/18/2024 13:24'
}
EPGCard >> revertFocusSize [

	self extent: self extent / self class focusSclaeFactor.
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:29'
}
EPGCard >> subHeaderOrigin [

	^ self header bounds origin + (0 @ self header height).
]

{
	#category : #'focus card',
	#'squeak_changestamp' : 'sv 6/22/2024 14:18'
}
EPGCard >> toggleFocusCard [

	self isFocus
		ifFalse: [self turn. 
			self makeFocusSize.
			self game focusCard: self.
			self beFocus.]
		ifTrue: [self turn.
			self revertFocusSize.
			self game unfocusCard: self.
			self moveToDone.
			self beUnfocus.].
]

{
	#category : #body,
	#'squeak_changestamp' : 'JP 7/8/2024 13:25'
}
EPGCard >> turn [

	self facing = #front
		ifTrue: [self facing: #back. self changeBody: self backBody. ^ self.].
	self facing = #back
		ifTrue: [self facing: #front. self changeBody: self frontBody. ^ self.].
]
