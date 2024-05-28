Class {
	#name : #EPGFeatureCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:57'
}
EPGFeatureCard >> initialize [

	super initialize.
	self colorBar: (Color fromString: '#fc5d5d') withLayout: #left.
]
