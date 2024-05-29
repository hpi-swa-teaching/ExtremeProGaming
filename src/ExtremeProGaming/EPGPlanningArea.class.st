Class {
	#name : #EPGPlanningArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/29/2024 21:55'
}
EPGPlanningArea >> initialize [

	super initialize.
	
	self
		extent: 200@250;
		enableDrop: false;
		initializeVisibleArea.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/29/2024 21:56'
}
EPGPlanningArea >> initializeCardStack [

	"TODO"
]
