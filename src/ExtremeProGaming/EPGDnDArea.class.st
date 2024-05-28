Class {
	#name : #EPGDnDArea,
	#superclass : #Morph,
	#instVars : [
		'area',
		'borderVisible',
		'dropped',
		'highlightColor',
		'dropEnabled',
		'pickEnabled'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'dragging/dropping',
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
	#category : #'dragging/dropping',
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
	#category : #border,
	#'squeak_changestamp' : 'JP 5/27/2024 23:27'
}
EPGDnDArea >> addBorder [

	self color: self highlightColor.
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
	#'squeak_changestamp' : 'JP 5/27/2024 22:34'
}
EPGDnDArea >> backgroundExtent [

	^ self extent.
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
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 5/28/2024 11:43'
}
EPGDnDArea >> dropEnabled [

	^ dropEnabled.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 5/28/2024 11:34'
}
EPGDnDArea >> dropEnabled: aBool [

	dropEnabled := aBool.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:33'
}
EPGDnDArea >> dropInMorph: aMorph [

	self addMorphFront: (aMorph center: self center).
	self dropped addFirst: aMorph.
	self removeBorder.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 5/27/2024 23:37'
}
EPGDnDArea >> dropInMorph: aMorph at: aPosition [

	self addMorphFront: (aMorph position:  aPosition).
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
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 18:03'
}
EPGDnDArea >> handlesMouseOverDragging: anEvent [

	anEvent wasHandled ifTrue: [^ false]. "not interested, e.g dragging the area itself"
	anEvent hand submorphs size = 1 ifFalse: [^ false].
	^ anEvent hand submorphs first isEPGDnDMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/27/2024 22:28'
}
EPGDnDArea >> highlightColor [

	^ highlightColor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/27/2024 22:48'
}
EPGDnDArea >> highlightColor: aColor [

	highlightColor :=  aColor.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 11:48'
}
EPGDnDArea >> initialize [

	super initialize.
	
	self dropEnabled: true;
		pickEnabled: true.
	
	"self
		color: Color transparent;
		highlightColor: Color green;
		extent: 350@500;
		initializeVisibleArea;
		addMorph: self area;
		borderVisible: false;
		dropped: OrderedCollection new."
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/27/2024 23:28'
}
EPGDnDArea >> initializeVisibleArea [

	self area: Morph new.
	self area
		color: Color gray lighter;
		extent: self backgroundExtent - (25 @ 25);
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
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 5/28/2024 11:25'
}
EPGDnDArea >> mouseEnterDragging: evt [

	self dropEnabled ifTrue: [self addBorder].
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 17:44'
}
EPGDnDArea >> mouseLeaveDragging: evt [

	self removeBorder.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/28/2024 11:48'
}
EPGDnDArea >> pickEnabled [
	^ pickEnabled
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/28/2024 11:48'
}
EPGDnDArea >> pickEnabled: anObject [
	pickEnabled := anObject
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'JP 5/28/2024 11:48'
}
EPGDnDArea >> pickUpMorph: aMorph [

	self pickEnabled ifTrue: [aMorph formerOwner: self.
	aMorph formerPosition: aMorph position.
	self dropped remove: aMorph.
	^ aMorph.]
]

{
	#category : #border,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:16'
}
EPGDnDArea >> removeBorder [

	self color: Color transparent.
	self borderVisible: false.
]

{
	#category : #border,
	#'squeak_changestamp' : 'HCH 5/27/2024 17:14'
}
EPGDnDArea >> toggleBorder [

	self borderVisible
		ifTrue: [self removeBorder. ]
		ifFalse: [self addBorder. ]
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/27/2024 13:38'
}
EPGDnDArea >> wantsDroppedMorph: aMorph event: evt [

	^ self dropEnabled and: [aMorph isEPGDnDMorph].
]
