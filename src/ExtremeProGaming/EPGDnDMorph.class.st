"
This provides a framework for concrete DnD Morphs. It should not be instantiated.
"
Class {
	#name : #EPGDnDMorph,
	#superclass : #Morph,
	#instVars : [
		'droppable'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:56'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:38'
}
EPGDnDMorph >> droppable [

	^ droppable.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:38'
}
EPGDnDMorph >> droppable: aBoolean [

	droppable := aBoolean.
]

{
	#category : #initialization,
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
	#'squeak_changestamp' : 'sv 7/9/2024 20:41'
}
EPGDnDMorph >> shouldDropOnMouseUp [

	^ self droppable.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'sv 7/9/2024 20:41'
}
EPGDnDMorph >> shouldDropOnMouseUp: aBoolean [

	self droppable: aBoolean.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 7/8/2024 13:25'
}
EPGDnDMorph >> slideBackToFormerSituation: evt [ 
	"A drop of the receiver having been rejected, slide it back to where it came from, if possible."

	| slideForm formerOwner formerPosition aWorld startPoint endPoint trans |
	formerOwner := self formerOwner.
	formerPosition := self formerPosition.
	(aWorld := evt hand world) ifNil: [^ self delete.]. "Likely a moribund hand from an EventRecorder playback."

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
	self justDroppedInto: formerOwner event: evt.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:57'
}
EPGDnDMorph >> wantsToBeDroppedInto: aMorph [

	^ aMorph isEPGDnDArea.
]
