"
Concrete DnD area to store and pick up available storypoints.
"
Class {
	#name : #EPGStorypointArea,
	#superclass : #EPGDnDArea,
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:55'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:17'
}
EPGStorypointArea class >> defaultExtent [

	^ 150 @ 200.
]

{
	#category : #features,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:27'
}
EPGStorypointArea >> addCustomStorypoint: aStorypoint [

	self game addDependent: aStorypoint.
	aStorypoint game: self game.
	self dropInMorph: aStorypoint.
]

{
	#category : #features,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:27'
}
EPGStorypointArea >> addStorypoints: aNumber [

	| newStorypoint |
	aNumber timesRepeat: [
		newStorypoint := EPGStorypoint new.
		self game addDependent: newStorypoint.
		newStorypoint game: self game.
		self dropInMorph: newStorypoint].
]

{
	#category : #features,
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 22:31'
}
EPGStorypointArea >> dropInMorph: aMorph [

	| range |
	range := self extent  - aMorph extent.
	self addMorphFront: (aMorph position: self position +  ((0 to: range x ) atRandom @ (0 to: range y) atRandom)).
	self dropped addFirst: aMorph.
	self removeBorder.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/10/2024 00:17'
}
EPGStorypointArea >> initialize [

	super initialize.
	
	self
		extent: self class defaultExtent;
		initializeVisibleArea.
]
