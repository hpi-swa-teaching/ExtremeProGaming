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
	#'squeak_changestamp' : 'sv 7/9/2024 23:12'
}
EPGCostDisplay class >> backendSymbol [

	^ ImageMorph new image: 
		(((GitAssetLoader for: 'ExtremeProGaming') 
		loadAsset: '/assets/TechnicalDebt_Backend.png' ) scaledToSize: 25@25).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:18'
}
EPGCostDisplay class >> debtCenterOffset [

	^ (self defaultExtent x / 4) @ 0.
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
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 09:19'
}
EPGCostDisplay class >> defaultBorderWitdth [

	^ 3.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:17'
}
EPGCostDisplay class >> defaultExtent [

	^ 180 @ 70.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:34'
}
EPGCostDisplay class >> font [

 	^ TextFontReference toFont: ((StrikeFont familyName: 'DejaVu' size: 69.0) asPointSize: self defaultExtent y / 7).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/30/2024 13:33'
}
EPGCostDisplay class >> frontendColor [

	^ Color red.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:35'
}
EPGCostDisplay class >> frontendSymbol [

	^ ImageMorph new image: 
		(((GitAssetLoader for: 'ExtremeProGaming') 
		loadAsset: '/assets/TechnicalDebt_Frontend.png' ) scaledToSize: 25@25).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:37'
}
EPGCostDisplay class >> maxStorypoints [

	^ 6.
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
	#'squeak_changestamp' : 'sv 7/9/2024 23:20'
}
EPGCostDisplay class >> nonDebtCenterOffset [

	^ self defaultExtent x / 2 @ 0.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:21'
}
EPGCostDisplay class >> plusUtil [

	^ self defaultExtent y / 14.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:23'
}
EPGCostDisplay class >> positionOffsets [

	^ Dictionary newFrom:
		{1 -> {0 @ 0}.
		2 -> {15 @ -15 . -15 @ 15}.
		3 -> {15 @ 15 . -15 @ 15 . 0 @ -15}.
		4 -> {-20 @ -20 . 20 @ -20 . -20 @ 20 . 20 @ 20}.
		5 -> {-20 @ -20 . 20 @ -20 . -20 @ 20 . 20 @ 20 . 0 @ 0}.
		6 -> {-20 @ -20 . -20 @ 0 . -20 @ 20 . 20 @ -20 . 20 @ 0 . 20 @ 20}.}.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:22'
}
EPGCostDisplay class >> slashUtil [

	^ self defaultExtent y / 10.
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
	#'squeak_changestamp' : 'sv 7/9/2024 23:19'
}
EPGCostDisplay >> debtCenter [

	^ self center + self class debtCenterOffset.
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
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 19:53'
}
EPGCostDisplay >> displayPerTechnicalDebt [

	| storypointOffset debtOffset debtMorph |
	storypointOffset := self class storypointOffset.
	debtOffset  := self class debtOffset.
	self isFrontend 
		ifTrue: [debtMorph := self class frontendSymbol center: self debtCenter + debtOffset]
		ifFalse: [debtMorph := self class backendSymbol center: self debtCenter + debtOffset].
	self
		addMorph: (self formatTechnicalDebtCost center: (self debtCenter + storypointOffset));
		addMorph: (self initializeSlash center: self debtCenter);
		addMorph: debtMorph.
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'sv 7/9/2024 23:29'
}
EPGCostDisplay >> displayPlus [

	self addMorph: (self initializePlus center: self center).
	
	
	
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
	#'squeak_changestamp' : 'sv 7/9/2024 23:34'
}
EPGCostDisplay >> formatTechnicalDebtCost [

	^ TextMorph new
		contents: (self perTechnicalDebt asString asText addAttribute: (self class font)).
		
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
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 09:19'
}
EPGCostDisplay >> initialize [

	super initialize.
	
	self 
		extent: self class defaultExtent;
		color: Color white;
		borderWidth: self class defaultBorderWitdth;
		borderColor: Color gray;
		storypoint: self class storypoint;
		display.
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 19:54'
}
EPGCostDisplay >> initializePlus [
	"Using plusUtil as a number dependent on the height of the costDisplay for calculating the position of the '+' symbol."
	
	| plusUtil vertices |
	plusUtil := self class plusUtil.
	vertices := {
		plusUtil negated @ 0 . 
		plusUtil @ 0 . 
		0 @ 0 . 
		0 @ plusUtil negated . 
		0 @ plusUtil . 
		0 @ 0}.
	^ PolygonMorph
		 	vertices: vertices 
			color: Color black 
			borderWidth: (plusUtil / 2 max: 3) 
			borderColor: Color black.
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 19:55'
}
EPGCostDisplay >> initializeSlash [
	"Using slashUtil as a number dependent on the height of the costDisplay for calculating the position of the '/' symbol for storypoints per TechnicalDebt."
	
	| slashUtil vertices |
	slashUtil := self class slashUtil.
	vertices := {
		slashUtil negated @ slashUtil. 
		slashUtil @ slashUtil negated . 
		0 @ 0}.
	^ PolygonMorph
		 	vertices: vertices 
			color: Color black 
			borderWidth: (slashUtil / 3 max: 4) 
			borderColor: Color black.
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
	#'squeak_changestamp' : 'sv 7/10/2024 09:33'
}
EPGCostDisplay >> nonDebtCenter [

	self perTechnicalDebt = 0
		ifTrue: [^ self center].
	^ self debtCenter - self class nonDebtCenterOffset.
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
	#category : #positioning,
	#'squeak_changestamp' : 'sv 7/9/2024 23:38'
}
EPGCostDisplay >> positionOffsetsFor: aNumber [

	(1 <= aNumber and: [aNumber <= self class maxStorypoints]) 
		ifFalse: [self error: 'Number of Storypoints cannot be outside [1,' + self class maxStorypoints + ']'].
	^ self class positionOffsets at: aNumber.
	
	
	
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
