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
