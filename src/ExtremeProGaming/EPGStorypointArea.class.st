Class {
	#name : #EPGStorypointArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'game'
	],
	#category : #ExtremeProGaming
}

{
	#category : #features,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:19'
}
EPGStorypointArea >> addStorypoints: aNumber [

	| newStorypoint |
	aNumber timesRepeat: [
		newStorypoint := EPGStorypoint new.
		self game addDependent: newStorypoint.
		self dropInMorph: newStorypoint]
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
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:37'
}
EPGStorypointArea >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:38'
}
EPGStorypointArea >> game: aGame [

	game := aGame.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:45'
}
EPGStorypointArea >> initialize [

	super initialize.
	
	self
		extent: 150 @ 200;
		initializeVisibleArea.
]
