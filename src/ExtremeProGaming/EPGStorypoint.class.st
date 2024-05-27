Class {
	#name : #EPGStorypoint,
	#superclass : #EPGDnDMorph,
	#instVars : [
		'timeToLive',
		'image'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/27/2024 23:15'
}
EPGStorypoint >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/27/2024 23:15'
}
EPGStorypoint >> image: anObject [
	image := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/27/2024 23:33'
}
EPGStorypoint >> initialize [

	super initialize.
	
	self color: Color transparent;
		extent: 100 @ 100;
		image: (ImageMorph new image:(((GitAssetLoader for: 'ExtremeProGaming') loadAsset: '/assets/Goldbär Dunkelrot (c) HARIBO_print.png') scaledToSize: 100 @ 100));
		addMorph: self image.
		
	self image center: self center.
]
