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
	#'squeak_changestamp' : 'JP 6/1/2024 11:04'
}
EPGPlanningArea >> initialize [

	super initialize.
	
	self
		extent: 200@250;
		enableDrop: false;
		initializeVisibleArea.
		
	self area color: Color transparent.
]
