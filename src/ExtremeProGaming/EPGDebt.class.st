Class {
	#name : #EPGDebt,
	#superclass : #EPGDnDArea,
	#instVars : [
		'timeToLife'
	],
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:10'
}
EPGDebt >> checkIfProcessed [

	(self dropped size == 1) ifTrue: [self abandon].
	(self dropped size > 1) ifTrue: [self error: 'To many Storypoints on one Technical Debt'].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:13'
}
EPGDebt >> initialize [

	super initialize.
	
	self
		extent: 100 @ 100;
		accepts: #(#EPGStorypoint);
		initializeVisibleArea.
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/29/2024 22:57'
}
EPGDebt >> setType: aType [

	(aType = #frontend) ifTrue: [self setTypeFrontend. ^ self].
	(aType = #backend) ifTrue: [self setTypeBackend. ^ self]
	ifFalse: [self error: 'Non valid Debt Type'].
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/29/2024 22:45'
}
EPGDebt >> setTypeBackend [

	self area color: Color blue darker darker.
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/29/2024 22:45'
}
EPGDebt >> setTypeFrontend [

	self area color: Color red darker darker.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:02'
}
EPGDebt >> update: anAspectSymbol with: aValueObject [

	anAspectSymbol = #newRound
		ifTrue: [self checkIfProcessed].
]
