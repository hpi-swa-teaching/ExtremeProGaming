Class {
	#name : #GameBoard,
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
	#'squeak_changestamp' : 'JA 5/16/2024 10:48'
}
GameBoard class >> boardExtent [

	^ 1920 @ 1080.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:23'
}
GameBoard >> backlogArea [
	^ backlogArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:23'
}
GameBoard >> backlogArea: anObject [
	backlogArea := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JA 5/16/2024 11:25'
}
GameBoard >> initialize [
	super initialize.
	
	self extent: self class boardExtent; 
		color: Color gray;
		initializeSectionMorphs.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JA 5/16/2024 11:24'
}
GameBoard >> initializeSectionMorphs [

	self planningArea:  Morph new;
		backlogArea: Morph new;
		reviewArea:  Morph new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:22'
}
GameBoard >> planningArea [
	^ planningArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:22'
}
GameBoard >> planningArea: anObject [
	planningArea := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:23'
}
GameBoard >> reviewArea [
	^ reviewArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:23'
}
GameBoard >> reviewArea: anObject [
	reviewArea := anObject
]
