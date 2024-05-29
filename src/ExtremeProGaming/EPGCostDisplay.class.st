Class {
	#name : #EPGCostDisplay,
	#superclass : #Morph,
	#instVars : [
		'frontend',
		'cost',
		'perTechnicalDebt',
		'storypoint'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:52'
}
EPGCostDisplay class >> font [

 	^ StrikeFont familyName: 'DejaVu' size: 69.0.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:04'
}
EPGCostDisplay class >> positionOffsets [

	^ Dictionary newFrom:
	{
		1 -> {0@0}.
		2 -> {15@ -15 . -15@15}.
		3 -> {15@ 15 . -15@15 . 0@ -15}.
		4 -> {-25@ -25 . 25@ -25 . -25@25 . 25@25}.
		5 -> {-25@ -25 . 25@ -25 . -25@25 . 25@25 . 0@0}.
		6 -> {-25@ -25 . -25@0 . -25@25 . 25@ -25 . 25@0 . 25@25}
	}
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
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:08'
}
EPGCostDisplay >> initialize [

	super initialize.
	
	self 
		perTechnicalDebt: 2;
		extent: 300 @ 100;
		storypoint: (Morph new extent: 15@15; color: Color green; yourself).
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
	#'squeak_changestamp' : 'HCH 5/29/2024 22:36'
}
EPGCostDisplay >> plus: aNumber [

	|vertices|
	vertices := {
		(aNumber / 2) negated @ 0 . 
		aNumber / 2 @ 0 . 
		0@0 . 
		0@(aNumber / 2) negated . 
		0@(aNumber / 2) . 0@0}.
	^ PolygonMorph
		 	vertices: vertices 
			color: Color black 
			borderWidth: (aNumber / 4 max: 5) 
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
	#category : #positioning,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:18'
}
EPGCostDisplay >> positionStorypoints [

	| offsets |
	offsets := self positionOffsetsFor: self cost.
	offsets do: [:offset | self addMorph: 
					(self storypoint shallowCopy center: self nonDebtCenter + offset)].
	
	
	
]

{
	#category : #symbols,
	#'squeak_changestamp' : 'HCH 5/29/2024 22:38'
}
EPGCostDisplay >> slash: aNumber [

	|vertices|
	vertices := {
		(aNumber / 2) negated @ (aNumber / 2) . 
		(aNumber / 2) @ (aNumber / 2) negated . 
		0@0}.
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
