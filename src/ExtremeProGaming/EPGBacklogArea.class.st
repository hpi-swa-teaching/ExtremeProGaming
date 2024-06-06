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
	#'squeak_changestamp' : 'JP 5/31/2024 14:37'
}
EPGBacklogArea >> image [

	^ image.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/31/2024 14:37'
}
EPGBacklogArea >> image: anImage [

	image := anImage.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 23:07'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		extent: 200 @ 250;
		accepts: #(#EPGBugCard #EPGFeatureCard);
		initializeVisibleArea.
		
	self area color: Color transparent.
]
