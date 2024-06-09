Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image',
		'amountOfStoryPoints'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:17'
}
EPGBacklogArea >> amounfOfStoryPoints [

	^ amountOfStoryPoints.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:17'
}
EPGBacklogArea >> amountOfStoryPoints: aNumber [

	amountOfStoryPoints := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:17'
}
EPGBacklogArea >> dropInMorph: aMorph [

	super dropInMorph: aMorph.
	aMorph isEPGStorypoint ifTrue: [self amountOfStoryPoints: self amounfOfStoryPoints + 1].
]

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
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:17'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		extent: 200 @ 250;
		amountOfStoryPoints: 0;
		accepts: #(#EPGBugCard #EPGFeatureCard #EPGStorypoint);
		initializeVisibleArea.
		
	self area color: Color transparent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 17:55'
}
EPGBacklogArea >> isEPGBacklogArea [

	^ true.
]
