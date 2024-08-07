"
Displays the current score which is the amount of processed feature cards.
"
Class {
	#name : #EPGFeatureScore,
	#superclass : #TextMorph,
	#instVars : [
		'score'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 13:03'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JP 6/19/2024 22:24'
}
EPGFeatureScore class >> defaultFont [

 	^ TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 30).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:48'
}
EPGFeatureScore class >> defaultMargins [

	^ 10 @ 10.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/9/2024 23:49'
}
EPGFeatureScore >> initialize [

	super initialize.
	
	self
		score: 0;
		setTextWithScore: self score;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		margins: self class defaultMargins;
		centered;
		backgroundColor: Color gray;
		lock.
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 22:21'
}
EPGFeatureScore >> score [

	^ score.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/20/2024 00:29'
}
EPGFeatureScore >> score: aScore [

	score := aScore.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 22:30'
}
EPGFeatureScore >> setTextWithScore: aNumber [

 	self contents: (('Features completed: ', aNumber) asText addAttribute: self class defaultFont).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/20/2024 00:29'
}
EPGFeatureScore >> updateScore [

	self
		score: self score + 1;
		setTextWithScore: self score.
]
