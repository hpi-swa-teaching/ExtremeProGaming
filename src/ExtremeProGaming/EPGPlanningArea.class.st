Class {
	#name : #EPGPlanningArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image',
		'startOfRound'
	],
	#category : #'ExtremeProGaming-UI'
}

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/23/2024 15:23'
}
EPGPlanningArea >> doubleClick: anEvent [

	self pickUpEnabled: true.
	(self pickUpMorph: self dropped first) toggleFocusCard.
	self pickUpEnabled: false.
	self startOfRound: false.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/23/2024 15:14'
}
EPGPlanningArea >> handlesMouseDown: anEvent [

	^ self dropped size > 0 and: [self dropped first isEPGEventCard].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:17'
}
EPGPlanningArea >> image [

	^ image.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:17'
}
EPGPlanningArea >> image: anImage [

	image := anImage.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:42'
}
EPGPlanningArea >> initialize [

	super initialize.
	
	self
		enableDrop: false;
		initializeVisibleArea.
		
	self area color: Color transparent.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/23/2024 15:11'
}
EPGPlanningArea >> mouseDown: anEvent [ 

	self startOfRound
		ifTrue: [anEvent hand waitForClicksOrDrag: self event: anEvent].
	anEvent wasHandled: false.
	super mouseDown: anEvent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:55'
}
EPGPlanningArea >> pickUpTopCard [

	(self dropped size = 0) ifTrue: [self error: 'Calling Top on empty Card Stack'].
	self dropped first isEPGBacklogCard ifFalse: [self error: 'Top was not a Card'].
	^ self pickUpMorph: self dropped first.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 15:12'
}
EPGPlanningArea >> startOfRound [

	^ startOfRound.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 15:37'
}
EPGPlanningArea >> startOfRound: aBoolean [

	startOfRound := aBoolean.
]
