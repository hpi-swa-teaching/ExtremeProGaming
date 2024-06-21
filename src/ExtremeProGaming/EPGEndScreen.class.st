Class {
	#name : #EPGEndScreen,
	#superclass : #EPGOverlay,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:12'
}
EPGEndScreen >> initialize [

	super initialize.
	self
		initializeStartButton: 'restart Game';
		initializeScoreDisplay: 'Your Score: '.
	
	
]
