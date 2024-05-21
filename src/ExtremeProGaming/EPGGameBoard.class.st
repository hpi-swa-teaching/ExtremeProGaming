Class {
	#name : #EPGGameBoard,
	#superclass : #Morph,
	#instVars : [
		'planningArea',
		'backlogArea',
		'reviewArea'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/21/2024 16:00'
}
EPGGameBoard class >> areaRatio [

	^ Dictionary newFrom: {'planning' -> 0.25. 'backlog' -> 0.5. 'review' -> 0.25}.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/16/2024 10:48'
}
EPGGameBoard class >> boardExtent [

	^ 1920 @ 1080.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:46'
}
EPGGameBoard >> backlogArea [
	^ backlogArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:46'
}
EPGGameBoard >> backlogArea: anObject [
	backlogArea := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 15:42'
}
EPGGameBoard >> calculateAreaExtendFor: aName [

	^ (self extent x * self class areaRatio at: aName) @ self extent y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 15:42'
}
EPGGameBoard >> calculateAreaPositionFor: aName [

	^ (self position x * self class areaRatio at: aName) @ self position y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 15:47'
}
EPGGameBoard >> createSectionMorphFor: aName [

	| sectionMorph |
	sectionMorph := Morph new extent: (self calculateAreaExtendFor: aName);
			position: (self calculateAreaPositionFor: aName);
			color: Color darkGray.

	self addMorph: sectionMorph.
	
	^ sectionMorph.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JA 5/21/2024 16:00'
}
EPGGameBoard >> initialize [
	super initialize.
	
	self extent: self class boardExtent; 
		color: Color gray;
		initializeSectionMorphs.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JA 5/21/2024 15:55'
}
EPGGameBoard >> initializeSectionMorphs [

	self planningArea: (self createSectionMorphFor: 'planning');
		backlogArea: (self createSectionMorphFor: 'backlog');
		reviewArea:  (self createSectionMorphFor: 'review').
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:46'
}
EPGGameBoard >> planningArea [
	^ planningArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:46'
}
EPGGameBoard >> planningArea: anObject [
	planningArea := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:46'
}
EPGGameBoard >> reviewArea [
	^ reviewArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:46'
}
EPGGameBoard >> reviewArea: anObject [
	reviewArea := anObject.
]
