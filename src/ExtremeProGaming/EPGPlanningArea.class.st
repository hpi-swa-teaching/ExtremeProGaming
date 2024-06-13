Class {
	#name : #EPGPlanningArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/1/2024 11:03'
}
EPGPlanningArea >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/1/2024 11:03'
}
EPGPlanningArea >> image: anObject [
	image := anObject
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
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/31/2024 13:57'
}
EPGPlanningArea >> initializeCardStack [

	"TODO"
]
