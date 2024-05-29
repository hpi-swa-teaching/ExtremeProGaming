Class {
	#name : #EPGStorypointArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #features,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:45'
}
EPGStorypointArea >> addAcceptanceToDroppedMorphs [

	self dropped do: [:morph | 
			self accepts do: [:selector | morph setProperty: selector toValue: true]].

	
]

{
	#category : #features,
	#'squeak_changestamp' : 'jmetrikat 5/29/2024 23:16'
}
EPGStorypointArea >> addStorypoints: aNumber [

	| newStorypoint |
	aNumber timesRepeat: [
		newStorypoint := EPGStorypoint new.
		self dropInMorph: newStorypoint]
]

{
	#category : #features,
	#'squeak_changestamp' : 'JP 5/27/2024 23:50'
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
	#'squeak_changestamp' : 'HCH 5/29/2024 00:51'
}
EPGStorypointArea >> initialize [

	super initialize.
	
	self
		draggable: false;
		highlightColor: Color green;
		extent: 150 @ 200;
		initializeVisibleArea.
		
	self addStorypoints: 3.
]