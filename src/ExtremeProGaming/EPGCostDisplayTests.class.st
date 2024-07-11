"
Tests if the costdisplay shows the right costs.
"
Class {
	#name : #EPGCostDisplayTests,
	#superclass : #MorphTest,
	#instVars : [
		'morphFront',
		'morphBack'
	],
	#category : #'ExtremeProGaming-Tests',
	#'squeak_changestamp' : 'JP 7/8/2024 13:16'
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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'JA 6/8/2024 18:51'
}
EPGCostDisplayTests >> setUp [

	morph := EPGCostDisplay newFrontendWithCost: 3 perTechnicalDebt: 3.
	morphFront := EPGCostDisplay newFrontendWithCost: 1 perTechnicalDebt: 3.
	morphBack := EPGCostDisplay newBackendWithCost: 2 perTechnicalDebt: 4.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'HCH 7/10/2024 14:05'
}
EPGCostDisplayTests >> tearDown [

	morph abandon.
	morphFront abandon.
	morphBack abandon.
]

{
	#category : #'test displaying',
	#'squeak_changestamp' : 'JA 6/8/2024 17:36'
}
EPGCostDisplayTests >> testDisplayLargeCostError [
	
	morph cost: 7.
	self should: [ morph display ] raise: Error.
]

{
	#category : #'test displaying',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:25'
}
EPGCostDisplayTests >> testDisplayStorypoints [
	
	| amountSubmorphsBeforeDisplaying amountSubmorphsAfterDisplaying |
	morph cost: 3.
	amountSubmorphsBeforeDisplaying := (morph submorphs) size.
	morph displayStorypoints.
	amountSubmorphsAfterDisplaying := (morph submorphs) size.

	self assert: amountSubmorphsAfterDisplaying equals: (amountSubmorphsBeforeDisplaying + 3).
	
]

{
	#category : #'test displaying',
	#'squeak_changestamp' : 'JA 6/8/2024 18:11'
}
EPGCostDisplayTests >> testDisplayZeroCostError [

	morph cost: 0.
	self should: [ morph display ] raise: Error.
]

{
	#category : #'test initialization',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:26'
}
EPGCostDisplayTests >> testInitializeCostDisplayBackend [

	| costDisplayMorph |
	costDisplayMorph := Morph new
		extent: self class displayExtent;
		color: Color white;
		borderWidth: self class displayBorderWidth;
		borderColor: Color gray.

	self
		assert: (costDisplayMorph extent) equals: (morphBack extent);
		assert: (costDisplayMorph color) equals: (morphBack color);
		assert: (costDisplayMorph borderWidth) equals: (morphBack borderWidth);
		assert: (costDisplayMorph borderColor) equals: (morphBack borderColor);
		assert: (morphBack storypoint extent) equals: (self class storypointExtent);
		assert: (morphBack storypoint color) equals: (Color green);
		assert: (morphBack isFrontend) equals: false;
		assert: (morphBack isBackend ) equals: true.
]

{
	#category : #'test initialization',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:26'
}
EPGCostDisplayTests >> testInitializeCostDisplayFrontend [

	| costDisplayMorph |
	costDisplayMorph := Morph new
		extent: self class displayExtent;
		color: Color white;
		borderWidth: self class displayBorderWidth;
		borderColor: Color gray.

	self
		assert: (costDisplayMorph extent) equals: (morphFront extent);
		assert: (costDisplayMorph color) equals: (morphFront color);
		assert: (costDisplayMorph borderWidth) equals: (morphFront borderWidth);
		assert: (costDisplayMorph borderColor) equals: (morphFront borderColor);
		assert: (morphFront storypoint extent) equals: (self class storypointExtent);
		assert: (morphFront storypoint color) equals: (Color green);
		assert: (morphFront isFrontend) equals: true;
		assert: (morphFront isBackend ) equals: false.
]
