"
Tests the programmatical interaction functionality of the abstract DnD Area.
"
Class {
	#name : #EPGDnDAreaTests,
	#superclass : #MorphTest,
	#instVars : [
		'dropMorph'
	],
	#category : #'ExtremeProGaming-Tests',
	#'squeak_changestamp' : 'HCH 7/9/2024 11:08'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'HCH 7/9/2024 11:02'
}
EPGDnDAreaTests >> setUp [

	morph := EPGDnDArea new.
	morph accepts: #(#testMorph).
	dropMorph := EPGDnDMorph new.
	dropMorph setProperty: #testMorph toValue: true.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:02'
}
EPGDnDAreaTests >> testAccept [

	self assert: true equals: (morph acceptsMorph: dropMorph).
	
	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:03'
}
EPGDnDAreaTests >> testDisabledDrop [

	morph dropEnabled: false.
	self assert: false equals: (morph wantsDroppedMorph: dropMorph event: DropEvent new).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:03'
}
EPGDnDAreaTests >> testDropIn [

	morph dropInMorph: dropMorph.
	self assert: 1 equals: morph dropped size.
	self assert: dropMorph equals: morph dropped first.
	morph clearArea.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:03'
}
EPGDnDAreaTests >> testEnabledDrop [

	morph dropEnabled: true.
	self assert: true equals: (morph wantsDroppedMorph: dropMorph event: DropEvent new).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:03'
}
EPGDnDAreaTests >> testFreeze [

	morph freeze.
	morph dropInMorph: dropMorph.
	self assert: nil equals: (morph pickUpMorph: dropMorph).
	morph unfreeze.
	self assert: dropMorph equals: (morph pickUpMorph: dropMorph).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:03'
}
EPGDnDAreaTests >> testPickUp [

	| pickUpMorph |
	morph dropInMorph: dropMorph.
	pickUpMorph := morph pickUpMorph: dropMorph.
	self assert: dropMorph equals: pickUpMorph.
	self assert: 0 equals: morph dropped size.
	morph clearArea.
	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:04'
}
EPGDnDAreaTests >> testReject [

	| rejectMorph |
	rejectMorph := Morph new.
	rejectMorph setProperty: #notTestMorph toValue: true.
	self assert: false equals: (morph acceptsMorph: rejectMorph).
	
	
	
]
