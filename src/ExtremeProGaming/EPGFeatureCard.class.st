Class {
	#name : #EPGFeatureCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/29/2024 23:13'
}
EPGFeatureCard >> initialize [

	super initialize.
	
	self colorBar: (Color fromString: '#fc5d5d') withLayout: #left.
]
