Class {
	#name : #EPGExtraFeature,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 19:06'
}
EPGExtraFeature class >> newWithGame: aGame [

	^ self new 
		game: aGame; 
		amount: 1.
]

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:54'
}
EPGExtraFeature >> apply [

	self game addFeatureCard.
]
