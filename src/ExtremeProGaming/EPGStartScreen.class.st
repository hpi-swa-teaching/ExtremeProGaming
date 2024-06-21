Class {
	#name : #EPGStartScreen,
	#superclass : #EPGOverlay,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:44'
}
EPGStartScreen >> initialize [

	super initialize.
	self
		score: EPGGame highScore;
		initializeStartButton: 'start Game';
		initializeScoreDisplay: 'Highscore: '.
	
	
]
