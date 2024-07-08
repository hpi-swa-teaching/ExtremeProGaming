Class {
	#name : #EPGDnDAreaTests,
	#superclass : #MorphTest,
	#category : #'ExtremeProGaming-Tests'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'HCH 7/8/2024 22:11'
}
EPGDnDAreaTests >> setUp [

	morph := EPGDnDArea new.
	morph accepts: #(#testMorph).
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:22'
}
EPGDnDAreaTests >> testAccept [

	| dropMorph |
	dropMorph := Morph new.
	dropMorph setProperty: #testMorph toValue: true.
	self assert: true equals: (morph acceptsMorph: dropMorph).
	
	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:36'
}
EPGDnDAreaTests >> testDisabledDrop [

	| dropMorph |
	morph dropEnabled: false.
	dropMorph := EPGDnDMorph new.
	dropMorph setProperty: #testMorph toValue: true.
	self assert: false equals: (morph wantsDroppedMorph: dropMorph event: DropEvent new).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:19'
}
EPGDnDAreaTests >> testDropIn [

	| dropMorph |
	dropMorph := Morph new.
	dropMorph setProperty: #testMorph toValue: true.
	morph dropInMorph: dropMorph.
	self assert: 1 equals: morph dropped size.
	self assert: dropMorph equals: morph dropped first.
	morph clearArea.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:36'
}
EPGDnDAreaTests >> testEnabledDrop [

	| dropMorph |
	morph dropEnabled: true.
	dropMorph := EPGDnDMorph new.
	dropMorph setProperty: #testMorph toValue: true.
	self assert: true equals: (morph wantsDroppedMorph: dropMorph event: DropEvent new).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:31'
}
EPGDnDAreaTests >> testFreeze [

	| dropMorph |
	morph freeze.
	dropMorph := EPGDnDMorph new.
	dropMorph setProperty: #testMorph toValue: true.
	morph dropInMorph: dropMorph.
	self assert: nil equals: (morph pickUpMorph: dropMorph).
	morph unfreeze.
	self assert: dropMorph equals: (morph pickUpMorph: dropMorph).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:19'
}
EPGDnDAreaTests >> testPickUp [

	| dropMorph pickUpMorph |
	dropMorph := Morph new.
	dropMorph setProperty: #testMorph toValue: true.
	morph dropInMorph: dropMorph.
	pickUpMorph := morph pickUpMorph: dropMorph.
	self assert: dropMorph equals: pickUpMorph.
	self assert: 0 equals: morph dropped size.
	morph clearArea.
	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 22:22'
}
EPGDnDAreaTests >> testReject [

	| dropMorph |
	dropMorph := Morph new.
	dropMorph setProperty: #notTestMorph toValue: true.
	self assert: false equals: (morph acceptsMorph: dropMorph).
	
	
	
]
