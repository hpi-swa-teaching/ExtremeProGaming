Class {
	#name : #EPGEndScreen,
	#superclass : #EPGOverlay,
	#category : #ExtremeProGaming
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
