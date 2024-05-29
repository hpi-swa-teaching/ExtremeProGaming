Class {
	#name : #EPGPlanningArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 21:31'
}
EPGPlanningArea >> initialize [

	super initialize.
	
	self
		highlightColor: Color green;
		extent: 200@250;
		backgroundMargin: 25@25;
		dropEnabled: false;
		initializeVisibleArea.
]
