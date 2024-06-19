Class {
	#name : #EPGDnDMorph,
	#superclass : #Morph,
	#instVars : [
		'droppable'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'sv 6/17/2024 14:59'
}
EPGDnDMorph >> initialize [

	super initialize.
	self shouldDropOnMouseUp: true.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:05'
}
EPGDnDMorph >> isEPGDnDMorph [

	^ true.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 6/19/2024 21:35'
}
EPGDnDMorph >> shouldDropOnMouseUp [

	^ droppable.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 6/19/2024 21:35'
}
EPGDnDMorph >> shouldDropOnMouseUp: aBoolean [

	droppable := aBoolean.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:38'
}
EPGDnDMorph >> slideBackToFormerSituation: evt [ 
	"A drop of the receiver having been rejected, slide it back to where it came from, if possible."

	| slideForm formerOwner formerPosition aWorld startPoint endPoint trans |
	formerOwner := self formerOwner.
	formerPosition := self formerPosition.
	(aWorld := evt hand world) ifNil: [^ self delete]. "Likely a moribund hand from an EventRecorder playback."

	trans := formerOwner transformFromWorld.
	slideForm := trans isPureTranslation 
				ifTrue: [self imageForm offset: 0 @ 0]
				ifFalse: 
					[((TransformationMorph new asFlexOf: self) transform: trans) imageForm 
						offset: 0 @ 0]. 
	startPoint := evt hand fullBounds origin.
	endPoint := trans localPointToGlobal: formerPosition.
	owner removeMorph: self.
	aWorld displayWorld.
	slideForm 
		slideFrom: startPoint
		to: endPoint
		nSteps: 12
		delay: 15.
	"The OLPC Virtual Screen wouldn't notice the last update here."
	self refreshWorld.
	formerOwner isEPGDnDArea
		ifTrue: [formerOwner dropInMorph: self]
		ifFalse: [formerOwner addMorph: self].
	self position: formerPosition.
	self justDroppedInto: formerOwner event: evt
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'sv 6/17/2024 15:26'
}
EPGDnDMorph >> update: anAspectSymbol [

	anAspectSymbol = #newRound
		ifTrue: [self checkIfProcessed.].
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:57'
}
EPGDnDMorph >> wantsToBeDroppedInto: aMorph [

	^ aMorph isEPGDnDArea.
]
