Class {
	#name : #EPGDnDArea,
	#superclass : #Morph,
	#instVars : [
		'area',
		'borderVisible',
		'dropped'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:27'
}
EPGDnDArea >> aboutToBeGrabbedBy: aHand [

	self dropped do: 
		[:sub | 
			(sub intersects: aHand bounds)
			 ifTrue: [^ self pickUpMorph: sub]].
	^ super aboutToBeGrabbedBy: aHand.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:55'
}
EPGDnDArea >> acceptDroppingMorph: aMorph event: evt [

	| layout |
	layout := self layoutPolicy.
	layout ifNil:[^self dropInMorph: aMorph].
	self privateAddMorph: aMorph 
		atIndex: (layout indexForInserting: aMorph at: evt position in: self).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:16'
}
EPGDnDArea >> addBorder [

	self color: Color green.
	self borderVisible: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:13'
}
EPGDnDArea >> area [

	^ area.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:13'
}
EPGDnDArea >> area: aMorph [

	area := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:15'
}
EPGDnDArea >> borderVisible [

	^ borderVisible.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:15'
}
EPGDnDArea >> borderVisible: aBoolean [

	borderVisible := aBoolean.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 13:35'
}
EPGDnDArea >> dropEnabled [
	^ true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:33'
}
EPGDnDArea >> dropInMorph: aMorph [

	self addMorphFront: (aMorph center: self center).
	self dropped addFirst: aMorph.
	self removeBorder.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 18:17'
}
EPGDnDArea >> dropped [

	^ dropped.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 18:17'
}
EPGDnDArea >> dropped: aCollection [

	dropped := aCollection.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:03'
}
EPGDnDArea >> handlesMouseOverDragging: anEvent [

	anEvent wasHandled ifTrue: [^ false]. "not interested, e.g dragging the area itself"
	anEvent hand submorphs size = 1 ifFalse: [^ false].
	^ anEvent hand submorphs first isEPGDnDMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:18'
}
EPGDnDArea >> initialize [

	super initialize.
	self
		color: Color transparent;
		extent: 120@120;
		initializeVisibleArea;
		addMorph: self area;
		borderVisible: false;
		dropped: OrderedCollection new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:13'
}
EPGDnDArea >> initializeVisibleArea [

	self area: Morph new.
	self area
		color: Color red;
		extent: 100@100;
		center: self center;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:57'
}
EPGDnDArea >> isEPGDnDArea [

	^ true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:44'
}
EPGDnDArea >> mouseEnterDragging: evt [

	self addBorder.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:44'
}
EPGDnDArea >> mouseLeaveDragging: evt [

	self removeBorder.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:33'
}
EPGDnDArea >> pickUpMorph: aMorph [

	aMorph formerOwner: self.
	aMorph formerPosition: aMorph position.
	self dropped remove: aMorph.
	^ aMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:16'
}
EPGDnDArea >> removeBorder [

	self color: Color transparent.
	self borderVisible: false.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:14'
}
EPGDnDArea >> toggleBorder [

	self borderVisible
		ifTrue: [self removeBorder. ]
		ifFalse: [self addBorder. ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 13:38'
}
EPGDnDArea >> wantsDroppedMorph: aMorph event: evt [

	^ self dropEnabled and: [aMorph isEPGDnDMorph].
]
