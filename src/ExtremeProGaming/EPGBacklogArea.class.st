Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 21:55'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		extent: 200@250;
		initializeVisibleArea.
]
