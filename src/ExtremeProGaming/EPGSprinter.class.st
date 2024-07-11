"
Implementation for the sprinter (visualizing the end of an iteration)
"
Class {
	#name : #EPGSprinter,
	#superclass : #AnimatedImageMorph,
	#instVars : [
		'finishedSprinting',
		'sprintingArea'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JA 7/9/2024 11:28'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JA 7/11/2024 18:02'
}
EPGSprinter class >> newFrom: anAnimatedImageMorph with: aSprintingArea [
	
	^ (self newFrom: anAnimatedImageMorph) 
		sprintingArea: aSprintingArea;
		finishedSprinting: true;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/9/2024 11:37'
}
EPGSprinter >> finishedSprinting [

	^ finishedSprinting.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/11/2024 00:57'
}
EPGSprinter >> finishedSprinting: aBoolean [

	finishedSprinting := aBoolean.
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
	#'squeak_changestamp' : 'JA 7/11/2024 00:59'
}
EPGSprinter >> sprintingArea [

	^ sprintingArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/11/2024 01:00'
}
EPGSprinter >> sprintingArea: aMorph [

	sprintingArea := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/11/2024 01:42'
}
EPGSprinter >> startSprinting [

	self 
		show;
		position: (self sprintingArea position - (self width @ 0));
		finishedSprinting: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/11/2024 01:18'
}
EPGSprinter >> step [

	super step.

	self finishedSprinting ifTrue: [^ nil].
	self position: (self position + (10 @ 0)).
	
	(self position x >=(self sprintingArea position x + self sprintingArea width)) ifTrue: [
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
