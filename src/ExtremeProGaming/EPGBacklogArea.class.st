Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image',
		'storyPoints'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:51'
}
EPGBacklogArea >> dropInMorph: aMorph [

	super dropInMorph: aMorph.
	aMorph isEPGStorypoint ifTrue: [self storyPoints: self storyPoints + 1].
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
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:51'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		extent: 200 @ 250;
		storyPoints: 0;
		accepts: #(#EPGBugCard #EPGFeatureCard #EPGStorypoint);
		initializeVisibleArea.
		
	self area color: Color transparent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:51'
}
EPGBacklogArea >> storyPoints [

	^ storyPoints.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:51'
}
EPGBacklogArea >> storyPoints: aNumber [

	storyPoints := aNumber.
]
