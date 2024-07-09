"
Implementation for the sprinter (visualizing the end of an iteration)
"
Class {
	#name : #EPGSprinter,
	#superclass : #AnimatedImageMorph,
	#instVars : [
		'finishedSprinting'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JA 7/9/2024 11:28'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/9/2024 11:37'
}
EPGSprinter >> finishedSprinting [

	^ finishedSprinting.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/8/2024 23:21'
}
EPGSprinter >> finishedSprinting: anObject [

	finishedSprinting := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/9/2024 11:29'
}
EPGSprinter >> initialize [

	self finishedSprinting: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/8/2024 23:26'
}
EPGSprinter >> startSprinting [

	self show.	
	self position: (self owner position - (self width @ 0)).
	self finishedSprinting: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/9/2024 11:36'
}
EPGSprinter >> step [

	super step.

	self finishedSprinting ifTrue: [^ nil].
	self position: (self position + (10 @ 0)).
	
	(self position x >=(self owner position x + self owner width)) ifTrue: [
		self finishedSprinting: true.
		self hide].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/9/2024 11:35'
}
EPGSprinter >> stepTime [

	^ 10.
]
