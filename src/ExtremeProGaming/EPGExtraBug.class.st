"
EPGEffect which adds new bug to the backlog.
"
Class {
	#name : #EPGExtraBug,
	#superclass : #EPGEffect,
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:44'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:45'
}
EPGExtraBug class >> newFromJSON: aJSONCardFormatted [

	^ self new.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 19:06'
}
EPGExtraBug class >> newWithGame: aGame [

	^ self new 
		game: aGame; 
		amount: 1.
]

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:54'
}
EPGExtraBug >> apply [

	self game addBugCard.
]
