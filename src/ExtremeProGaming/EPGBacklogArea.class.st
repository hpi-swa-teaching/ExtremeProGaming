Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/31/2024 12:32'
}
EPGBacklogArea >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/31/2024 12:32'
}
EPGBacklogArea >> image: anObject [
	image := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/31/2024 12:40'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		extent: 200 @ 250;
		initializeVisibleArea.
		
	self area color: Color transparent.
]
