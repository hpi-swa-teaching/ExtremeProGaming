"
Dynamically displays the costs of a card.
"
Class {
	#name : #EPGCostDisplay,
	#superclass : #Morph,
	#instVars : [
		'frontend',
		'cost',
		'perTechnicalDebt',
		'storypoint'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 10:52'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/30/2024 13:33'
}
EPGCostDisplay class >> backendColor [

	^ Color magenta.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:15'
}
EPGCostDisplay class >> debtOffset [

	^ 15 @ 15.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:52'
}
EPGCostDisplay class >> font [

 	^ StrikeFont familyName: 'DejaVu' size: 69.0.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/30/2024 13:33'
}
EPGCostDisplay class >> frontendColor [

	^ Color red.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 5/30/2024 13:42'
}
EPGCostDisplay class >> newBackendWithCost: aCost perTechnicalDebt: aNumber [

	^ self basicNew
		beBackend;
		cost: aCost;
		perTechnicalDebt: aNumber;
		initialize.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 5/30/2024 13:42'
}
EPGCostDisplay class >> newFrontendWithCost: aCost perTechnicalDebt: aNumber [

	^ self basicNew
		beFrontend;
		cost: aCost;
		perTechnicalDebt: aNumber;
		initialize.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:12'
}
EPGCostDisplay class >> positionOffsets [

	^ Dictionary newFrom:
	{
		1 -> {0 @ 0}.
		2 -> {15 @ -15 . -15 @ 15}.
		3 -> {15 @ 15 . -15 @ 15 . 0 @ -15}.
		4 -> {-20 @ -20 . 20 @ -20 . -20 @ 20 . 20 @ 20}.
		5 -> {-20 @ -20 . 20 @ -20 . -20 @ 20 . 20 @ 20 . 0 @ 0}.
		6 -> {-20 @ -20 . -20 @ 0 . -20 @ 20 . 20 @ -20 . 20 @ 0 . 20 @ 20}.
	}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:40'
}
EPGCostDisplay class >> storypoint [

	^ Morph new extent: 12@12; color: Color green.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:15'
}
EPGCostDisplay class >> storypointOffset [

	^ -15 @ -15.
]

{
	#category : #display,
	#'squeak_changestamp' : 'HCH 6/1/2024 15:11'
}
EPGCostDisplay >> backendSymbol [

	^ ImageMorph new image: 
		(((GitAssetLoader for: 'ExtremeProGaming') 
		loadAsset: '/assets/TechnicalDebt_Backend.png' ) scaledToSize: 25@25).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:31'
}
EPGCostDisplay >> beBackend [

	self frontend: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:31'
}
EPGCostDisplay >> beFrontend [

	self frontend: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:32'
}
EPGCostDisplay >> cost [

	^ cost.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:32'
}
EPGCostDisplay >> cost: aNumber [

	cost := aNumber.
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:38'
}
EPGCostDisplay >> debtCenter [

	^ self center + ((self width / 4) @ 0).
]

{
	#category : #display,
	#'squeak_changestamp' : 'HCH 5/30/2024 13:31'
}
EPGCostDisplay >> display [

	self displayStorypoints.
	self perTechnicalDebt > 0
		ifTrue: [self 
					displayPlus;
					displayPerTechnicalDebt].
	^ self.
]

{
	#category : #display,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:14'
}
EPGCostDisplay >> displayPerTechnicalDebt [

	| storypointOffset debtOffset debtMorph |
	storypointOffset := self class storypointOffset.
	debtOffset  := self class debtOffset.
	self isFrontend 
		ifTrue: [debtMorph := self frontendSymbol center: self debtCenter + debtOffset]
		ifFalse: [debtMorph := self  backendSymbol center: self debtCenter + debtOffset].
	self addMorph: (self formatTechnicalDebtCost center: (self debtCenter + storypointOffset)).
	self addMorph: ((self slash: self height / 5) center: self debtCenter).
	self addMorph: debtMorph.
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:38'
}
EPGCostDisplay >> displayPlus [

	self addMorph: ((self plus: self height / 7) center: self center).
	
	
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'HCH 5/30/2024 13:14'
}
EPGCostDisplay >> displayStorypoints [

	| offsets |
	offsets := self positionOffsetsFor: self cost.
	offsets do: [:offset | self addMorph: 
					(self storypoint shallowCopy center: self nonDebtCenter + offset)].
	
	
	
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:58'
}
EPGCostDisplay >> font [

	^ TextFontReference toFont: (self class font asPointSize: (self height / 7)).
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:55'
}
EPGCostDisplay >> formatTechnicalDebtCost [

	^ TextMorph new
		contents: (self perTechnicalDebt asString asText addAttribute: (self font)).
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:30'
}
EPGCostDisplay >> frontend [

	^ frontend.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:30'
}
EPGCostDisplay >> frontend: aBoolean [

	frontend := aBoolean.
]

{
	#category : #display,
	#'squeak_changestamp' : 'HCH 6/1/2024 15:11'
}
EPGCostDisplay >> frontendSymbol [

	^ ImageMorph new image: 
		(((GitAssetLoader for: 'ExtremeProGaming') 
		loadAsset: '/assets/TechnicalDebt_Frontend.png' ) scaledToSize: 25@25).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:38'
}
EPGCostDisplay >> initialize [

	super initialize.
	
	self 
		extent: 180 @ 70;
		color: Color white;
		borderWidth: 3;
		borderColor: Color gray;
		storypoint: self class storypoint;
		display.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:31'
}
EPGCostDisplay >> isBackend [

	^ self frontend not.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:31'
}
EPGCostDisplay >> isFrontend [

	^ self frontend.
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:43'
}
EPGCostDisplay >> nonDebtCenter [

	perTechnicalDebt = 0
		ifTrue: [^ self center].
	^ self debtCenter - (self width / 2@ 0).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:32'
}
EPGCostDisplay >> perTechnicalDebt [

	^ perTechnicalDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:32'
}
EPGCostDisplay >> perTechnicalDebt: aNumber [

	perTechnicalDebt := aNumber.
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:39'
}
EPGCostDisplay >> plus: aNumber [

	|vertices|
	vertices := {
		(aNumber / 2) negated @ 0 . 
		aNumber / 2 @ 0 . 
		0 @ 0 . 
		0 @ (aNumber / 2) negated . 
		0 @ (aNumber / 2) . 0 @ 0}.
	^ PolygonMorph
		 	vertices: vertices 
			color: Color black 
			borderWidth: (aNumber / 4 max: 3) 
			borderColor: Color black.
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'HCH 5/29/2024 21:56'
}
EPGCostDisplay >> positionOffsetsFor: aNumber [

	(1 <= aNumber and: [aNumber <= 6]) 
		ifFalse: [self error: 'Number of Storypoints cannot be outside [1,6]'].
	^ self class positionOffsets at: aNumber.
	
	
	
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:00'
}
EPGCostDisplay >> slash: aNumber [

	|vertices|
	vertices := {
		(aNumber / 2) negated @ (aNumber / 2) . 
		(aNumber / 2) @ (aNumber / 2) negated . 
		0 @ 0}.
	^ PolygonMorph
		 	vertices: vertices 
			color: Color black 
			borderWidth: (aNumber / 6 max: 4) 
			borderColor: Color black.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:07'
}
EPGCostDisplay >> storypoint [

	^ storypoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:07'
}
EPGCostDisplay >> storypoint: aMorph [

	storypoint := aMorph.
]
