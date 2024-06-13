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
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 15:00'
}
EPGCostDisplayTests class >> displayBorderWidth [

	^ 3.


]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:59'
}
EPGCostDisplayTests class >> displayExtent [

	^ 180 @ 70.


]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:59'
}
EPGCostDisplayTests class >> storypointExtent [

	^ 12 @ 12.


]

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
	#'squeak_changestamp' : 'HCH 6/12/2024 15:00'
}
EPGCostDisplayTests >> testInitializeCostDisplayBackend [

	| costDisplayMorph |
	
	costDisplayMorph := Morph new
		extent: self class displayExtent;
		color: Color white;
		borderWidth: self class displayBorderWidth;
		borderColor: Color gray.

	self assert: (costDisplayMorph extent) equals: (morphBack extent).
	self assert: (costDisplayMorph color) equals: (morphBack color).
	self assert: (costDisplayMorph borderWidth) equals: (morphBack borderWidth).
	self assert: (costDisplayMorph borderColor) equals: (morphBack borderColor).
	
	self assert: (morphBack storypoint extent) equals: (self class storypointExtent).
	self assert: (morphBack storypoint color) equals: (Color green).
	
	self assert: (morphBack isFrontend) equals: false.
	self assert: (morphBack isBackend ) equals: true.
]

{
	#category : #initializing,
	#'squeak_changestamp' : 'HCH 6/12/2024 15:01'
}
EPGCostDisplayTests >> testInitializeCostDisplayFrontend [

	| costDisplayMorph |
	
	costDisplayMorph := Morph new
		extent: self class displayExtent;
		color: Color white;
		borderWidth: self class displayBorderWidth;
		borderColor: Color gray.

	self assert: (costDisplayMorph extent) equals: (morphFront extent).
	self assert: (costDisplayMorph color) equals: (morphFront color).
	self assert: (costDisplayMorph borderWidth) equals: (morphFront borderWidth).
	self assert: (costDisplayMorph borderColor) equals: (morphFront borderColor).
	
	self assert: (morphFront storypoint extent) equals: (self class storypointExtent).
	self assert: (morphFront storypoint color) equals: (Color green).
	
	self assert: (morphFront isFrontend) equals: true.
	self assert: (morphFront isBackend ) equals: false.
]
