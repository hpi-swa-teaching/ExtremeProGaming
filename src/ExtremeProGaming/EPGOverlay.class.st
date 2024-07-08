"
Blueprint for start- and endscreen, with common design components.
"
Class {
	#name : #EPGOverlay,
	#superclass : #Morph,
	#instVars : [
		'score',
		'game'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 13:09'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:55'
}
EPGOverlay class >> buttonExtent [

	^ 450 @ 100.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 16:03'
}
EPGOverlay class >> buttonOffset [

	^ -475 @ 518.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 16:35'
}
EPGOverlay class >> defaultFont [

	^ StrikeFont familyName: 'Bitmap DejaVu Sans' size: 30.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:50'
}
EPGOverlay class >> mountAgilityExtent [

	^   1000 @ 986.
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'jmetrikat 6/21/2024 09:31'
}
EPGOverlay class >> newWithScore: aNumber [

	^ self basicNew
			score: aNumber;
			initialize.
		
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:27'
}
EPGOverlay class >> overlayColor [

	^ Color darkGray.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 16:03'
}
EPGOverlay class >> overlayExtent [

	^ 1000 @ 1286.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:58'
}
EPGOverlay class >> scoreOffset [

	^ 25 @ 518.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:50'
}
EPGOverlay class >> titleExtent [

	^  1000 @ 100.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:51'
}
EPGOverlay class >> titlePosition [

	^ 0 @ 35.
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
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:35'
}
EPGOverlay >> initialize [

	super initialize.
	
	self
		extent: self class overlayExtent;
		color: self class overlayColor;
		initializeTitle;
		initializeMountAgility.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 7/8/2024 10:18'
}
EPGOverlay >> initializeMountAgility [

	self addMorph: (ImageMorph new
		image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/mount_agility.jpg')) scaledToSize: self class mountAgilityExtent);
		center: self center;
		yourself).
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/26/2024 16:23'
}
EPGOverlay >> initializeScoreDisplay: label [
	
	self addMorph: (TextMorph new
		position: self center + self class scoreOffset;
		backgroundColor: self class overlayColor lighter;
		contents: ((label , (self score ifNil:['---'])) asText addAttribute: (TextFontReference toFont: self class defaultFont));
		centered;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		margins: 10 @ 35;
		useRoundedCorners;
		extent: self class buttonExtent;
		lock).
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:55'
}
EPGOverlay >> initializeStartButton: label [

	self addMorph: (SimpleButtonMorph new
		useRoundedCorners;
		label: label font: self class defaultFont;
		extent: self class buttonExtent;
		position: self center + self class buttonOffset;
		color: self class overlayColor lighter;
		target: [self startGame];
		actionSelector: #value;
		yourself).
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/26/2024 15:50'
}
EPGOverlay >> initializeTitle [

	self addMorph: (ImageMorph new
		image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/title.png')) scaledToSize: self class titleExtent);
		position: self class titlePosition;
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
	#'squeak_changestamp' : 'HCH 6/23/2024 16:41'
}
EPGOverlay >> startGame [
	
	EPGGame new 
		center: self center;
		freezeDnD;
		openInWorld.
	self abandon.
	
]
