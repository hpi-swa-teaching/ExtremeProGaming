Class {
	#name : #EPGCostDisplayTests,
	#superclass : #MorphTest,
	#instVars : [
		'morphFront',
		'morphBack'
	],
	#category : #ExtremeProGaming
}

{
	#category : #initializing,
	#'squeak_changestamp' : 'JA 6/8/2024 18:51'
}
EPGCostDisplayTests >> setUp [

	morph := EPGCostDisplay newFrontendWithCost: 3 perTechnicalDebt: 3.
	morphFront := EPGCostDisplay newFrontendWithCost: 1 perTechnicalDebt: 3.
	morphBack := EPGCostDisplay newBackendWithCost: 2 perTechnicalDebt: 4.
]

{
	#category : #displaying,
	#'squeak_changestamp' : 'JA 6/8/2024 17:36'
}
EPGCostDisplayTests >> testDisplayLargeCostError [
	
	morph cost: 7.
	self should: [ morph display ] raise: Error.
]

{
	#category : #displaying,
	#'squeak_changestamp' : 'JA 6/8/2024 18:24'
}
EPGCostDisplayTests >> testDisplayStorypoints [
	
	| amountSubmorphsBeforeDisplaying amountSubmorphsAfterDisplaying|
	
	morph cost: 3.
	amountSubmorphsBeforeDisplaying := (morph submorphs) size.
	morph displayStorypoints.
	amountSubmorphsAfterDisplaying := (morph submorphs) size.

	self assert: amountSubmorphsAfterDisplaying equals: (amountSubmorphsBeforeDisplaying + 3).
	
]

{
	#category : #displaying,
	#'squeak_changestamp' : 'JA 6/8/2024 18:11'
}
EPGCostDisplayTests >> testDisplayZeroCostError [

	morph cost: 0.
	self should: [ morph display ] raise: Error.
]

{
	#category : #initializing,
	#'squeak_changestamp' : 'JA 6/8/2024 18:49'
}
EPGCostDisplayTests >> testInitializeCostDisplayBackend [

	| costDisplayMorph |
	
	costDisplayMorph := Morph new
		extent: 250 @ 100;
		color: Color white;
		borderWidth: 5;
		borderColor: Color gray.

	self assert: (costDisplayMorph extent) equals: (morphBack extent).
	self assert: (costDisplayMorph color) equals: (morphBack color).
	self assert: (costDisplayMorph borderWidth) equals: (morphBack borderWidth).
	self assert: (costDisplayMorph borderColor) equals: (morphBack borderColor).
	
	self assert: (morphBack storypoint extent) equals: (15 @ 15).
	self assert: (morphBack storypoint color) equals: (Color green).
	
	self assert: (morphBack isFrontend) equals: false.
	self assert: (morphBack isBackend ) equals: true.
]

{
	#category : #initializing,
	#'squeak_changestamp' : 'JA 6/8/2024 18:50'
}
EPGCostDisplayTests >> testInitializeCostDisplayFrontend [

	| costDisplayMorph |
	
	costDisplayMorph := Morph new
		extent: 250 @ 100;
		color: Color white;
		borderWidth: 5;
		borderColor: Color gray.

	self assert: (costDisplayMorph extent) equals: (morphFront extent).
	self assert: (costDisplayMorph color) equals: (morphFront color).
	self assert: (costDisplayMorph borderWidth) equals: (morphFront borderWidth).
	self assert: (costDisplayMorph borderColor) equals: (morphFront borderColor).
	
	self assert: (morphFront storypoint extent) equals: (15 @ 15).
	self assert: (morphFront storypoint color) equals: (Color green).
	
	self assert: (morphFront isFrontend) equals: true.
	self assert: (morphFront isBackend ) equals: false.
]
