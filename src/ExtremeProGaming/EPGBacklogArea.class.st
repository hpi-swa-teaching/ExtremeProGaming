Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 21:51'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		extent: 200 @ 250;
		initializeVisibleArea.
]
