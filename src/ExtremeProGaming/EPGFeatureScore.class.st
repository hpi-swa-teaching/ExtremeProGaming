Class {
	#name : #EPGFeatureScore,
	#superclass : #TextMorph,
	#instVars : [
		'score'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 6/19/2024 22:24'
}
EPGFeatureScore class >> defaultFont [

 	^ TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 30).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/19/2024 22:32'
}
EPGFeatureScore >> initialize [

	super initialize.
	
	self
		score: 0;
		setTextWithScore: self score;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		margins: 10 @ 10;
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
	#'squeak_changestamp' : 'JP 6/19/2024 22:32'
}
EPGFeatureScore >> score: anObject [

	score := anObject.
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
	#'squeak_changestamp' : 'JP 6/19/2024 22:32'
}
EPGFeatureScore >> updateScore [

	self score: self score + 1.
	self setTextWithScore: self score.
]
