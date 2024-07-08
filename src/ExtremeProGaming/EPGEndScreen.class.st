"
End screen which shows your accomplished score and provides the ability to restart the game.
"
Class {
	#name : #EPGEndScreen,
	#superclass : #EPGOverlay,
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 13:12'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/21/2024 09:32'
}
EPGEndScreen >> initialize [

	super initialize.
	
	self
		initializeStartButton: 'Restart Game';
		initializeScoreDisplay: 'Your Score: '.
	
	
]
