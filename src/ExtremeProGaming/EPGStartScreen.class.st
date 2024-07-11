"
End screen which shows the highscore and provides the ability to start the game.
"
Class {
	#name : #EPGStartScreen,
	#superclass : #EPGOverlay,
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 13:12'
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
