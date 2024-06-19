"
This provides a framework for concrete DnD Areas. It should not be instantiated.
"
Class {
	#name : #EPGDnDArea,
	#superclass : #Morph,
	#instVars : [
		'game',
		'area',
		'borderVisible',
		'dropped',
		'highlightColor',
		'dropEnabled',
		'pickUpEnabled',
		'accepts',
		'backgroundMargin',
		'draggable'
	],
	#category : #ExtremeProGaming,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:29'
}

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/29/2024 00:50'
}
EPGDnDArea >> aboutToBeGrabbedBy: aHand [

	self dropped do: 
		[:sub | 
			(sub intersects: aHand bounds)
			 ifTrue: [^ self pickUpMorph: sub]].
	self draggable ifTrue: [^ super aboutToBeGrabbedBy: aHand].
	^ nil.
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:13'
}
EPGDnDArea >> accepts [

	^ accepts.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:14'
}
EPGDnDArea >> accepts: aCollection [

	accepts := aCollection.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 22:28'
}
EPGDnDArea >> acceptsMorph: aMorph [

	^ self accepts anySatisfy: [:selector | aMorph hasProperty: selector].
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
	#'squeak_changestamp' : 'JP 6/14/2024 00:33'
}
EPGDnDArea >> backgroundExtent [

	^ self extent - self backgroundMargin.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:20'
}
EPGDnDArea >> backgroundMargin [

	^ backgroundMargin.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:21'
}
EPGDnDArea >> backgroundMargin: aPoint [

	backgroundMargin := aPoint.
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:49'
}
EPGDnDArea >> draggable [

	^ draggable.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 00:49'
}
EPGDnDArea >> draggable: aBoolean [

	draggable := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/28/2024 11:43'
}
EPGDnDArea >> dropEnabled [

	^ dropEnabled.
]

{
	#category : #accessing,
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
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 12:40'
}
EPGDnDArea >> dropInMorph: aMorph at: aPosition [

	self addMorphFront: (aMorph center: aPosition + self bounds origin).
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
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:27'
}
EPGDnDArea >> dropped: aCollection [

	dropped := aCollection.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'sv 6/18/2024 13:31'
}
EPGDnDArea >> freeze [

	self pickUpEnabled: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 21:05'
}
EPGDnDArea >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 21:06'
}
EPGDnDArea >> game: aGame [

	game := aGame.
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
	#'squeak_changestamp' : 'sv 6/18/2024 13:28'
}
EPGDnDArea >> initialize [

	super initialize.
	
	self
		dropEnabled: true;
		pickUpEnabled: true;
		draggable: false;
		highlightColor: Color green;
		color: Color transparent;
		borderVisible: false;
		dropped: OrderedCollection new;
		accepts: #();
		backgroundMargin: 15 @ 15;
		extent: EPGCard cardExtent + self backgroundMargin.
		

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/14/2024 00:31'
}
EPGDnDArea >> initializeVisibleArea [

	self area: Morph new.
	self area
		color: Color gray lighter;
		extent: self backgroundExtent;
		center: self center.
	self addMorph: self area.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 17:54'
}
EPGDnDArea >> isEPGBacklogArea [

	^ false.
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
	#'squeak_changestamp' : 'sv 6/18/2024 13:27'
}
EPGDnDArea >> pickUpEnabled [

	^ pickUpEnabled.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/18/2024 13:27'
}
EPGDnDArea >> pickUpEnabled: aBoolean [

	pickUpEnabled := aBoolean.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'sv 6/18/2024 13:28'
}
EPGDnDArea >> pickUpMorph: aMorph [

	self pickUpEnabled ifTrue: [
		aMorph formerOwner: self.
		aMorph formerPosition: aMorph position.
		self dropped remove: aMorph.
		^ aMorph.]
	ifFalse: [^ nil.].
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 5/29/2024 01:01'
}
EPGDnDArea >> rejectMorph [

	self removeBorder.
	^ false.
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
	#'squeak_changestamp' : 'sv 6/18/2024 13:31'
}
EPGDnDArea >> unfreeze [

	self pickUpEnabled: true.
]

{
	#category : #'dragging/dropping',
	#'squeak_changestamp' : 'HCH 6/15/2024 22:30'
}
EPGDnDArea >> wantsDroppedMorph: aMorph event: evt [

	(self dropEnabled 
		and: [aMorph isEPGDnDMorph] 
		and: [self acceptsMorph: aMorph])
		ifFalse: [^ self rejectMorph].
	^ true.
]
