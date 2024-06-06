Class {
	#name : #EPGIterationCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:30'
}
EPGIterationCard class >> headerSymbol [

	^ ImageMorph new
		image:
			(((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Event.png')
			scaledToSize: 30@30).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 22:48'
}
EPGIterationCard >> initialize [

	super initialize.
	
	self
		colorBar: (Color fromString: '#ffe1a1') withLayout: #full;
		setProperty: #EPGIterationCard toValue: true.
]
