Class {
	#name : #EPGStartScreen,
	#superclass : #EPGOverlay,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/21/2024 09:25'
}
EPGStartScreen >> initialize [

	super initialize.
	
	self
		center: World center;
		score: EPGGame highScore;
		initializeStartButton: 'Start Game';
		initializeScoreDisplay: 'Highscore: '.
	
	
]
