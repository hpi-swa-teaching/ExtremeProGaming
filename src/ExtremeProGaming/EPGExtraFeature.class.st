Class {
	#name : #EPGExtraFeature,
	#superclass : #EPGEffect,
	#category : #'ExtremeProGaming-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:45'
}
EPGExtraFeature class >> newFromJSON: aJSONCardFormatted [

	^ self new.
]

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
