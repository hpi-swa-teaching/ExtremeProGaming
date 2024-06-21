Class {
	#name : #EPGOverlay,
	#superclass : #Morph,
	#instVars : [
		'score',
		'game'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:18'
}
EPGOverlay class >> buttonExtent [

	^ 500 @ 200.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:38'
}
EPGOverlay class >> newWithScore: aNumber [

	^self basicNew
			score: aNumber;
			initialize.
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:29'
}
EPGOverlay class >> overlayColor [

	^ Color gray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:26'
}
EPGOverlay class >> overlayExtent [

	^ 2000 @ 1310.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:40'
}
EPGOverlay >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:40'
}
EPGOverlay >> game: aGame [

	game := aGame.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:29'
}
EPGOverlay >> initialize [

	super initialize.
	self
		extent: self class overlayExtent;
		color: self class overlayColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:10'
}
EPGOverlay >> initializeScoreDisplay: label [
	
	
	self addMorph: (TextMorph new
		position: self center - (250 @ 200);
		useRoundedCorners;
		contents: label , (self score ifNil:['---']);
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		margins: 10 @ 10;
		extent: self class buttonExtent;
		centered;
		backgroundColor: self class overlayColor lighter;
		lock).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:11'
}
EPGOverlay >> initializeStartButton: label [

	self addMorph: (SimpleButtonMorph new
		useRoundedCorners;
		label: label;
		extent: self class buttonExtent;
		center: self center;
		color: self class overlayColor lighter;
		target: [self startGame];
		actionSelector: #value;
		yourself).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:51'
}
EPGOverlay >> score [

	^ score.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:52'
}
EPGOverlay >> score: aNumber [

	score := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:52'
}
EPGOverlay >> startGame [
	EPGGame new openInWorld.
	self abandon.
	
]
