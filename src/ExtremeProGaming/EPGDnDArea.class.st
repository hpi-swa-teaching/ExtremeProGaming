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
		'draggable'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'HCH 5/29/2024 00:29'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:42'
}
EPGDnDArea class >> backgroundMargin [

	^ 15 @ 15.
]

{
	#category : #'dropping/grabbing',
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
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 19:51'
}
EPGDnDArea >> acceptDroppingMorph: aMorph event: evt [

	| layout |
	layout := self layoutPolicy.
	layout ifNil: [^ self dropInMorph: aMorph.].
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
	#category : #'dropping/grabbing',
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
	#'squeak_changestamp' : 'sv 7/9/2024 23:43'
}
EPGDnDArea >> backgroundExtent [

	^ self extent - self class backgroundMargin.
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
	#'squeak_changestamp' : 'HCH 6/20/2024 19:51'
}
EPGDnDArea >> clearArea [

	self dropped do: [:drop | self removeMorph: drop].
	self dropped removeAll.
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
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'JP 5/28/2024 11:43'
}
EPGDnDArea >> dropEnabled [

	^ dropEnabled.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'JP 5/28/2024 11:34'
}
EPGDnDArea >> dropEnabled: aBool [

	dropEnabled := aBool.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'HCH 6/23/2024 14:53'
}
EPGDnDArea >> dropInMorph: aMorph [

	self addMorphFront: (aMorph center: self center).
	self dropped addFirst: aMorph.
	self removeBorder.
]

{
	#category : #'dropping/grabbing',
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
	#category : #'dropping/grabbing',
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
	#category : #'event handling',
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
	#'squeak_changestamp' : 'sv 7/9/2024 23:44'
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
		extent: EPGCard cardExtent + self class backgroundMargin.
		

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
	#'squeak_changestamp' : 'HCH 5/27/2024 17:57'
}
EPGDnDArea >> isEPGDnDArea [

	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JP 5/28/2024 11:25'
}
EPGDnDArea >> mouseEnterDragging: evt [

	self dropEnabled ifTrue: [self addBorder].
]

{
	#category : #'event handling',
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
	#category : #'dropping/grabbing',
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
	#category : #'dropping/grabbing',
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
	#category : #'event handling',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:36'
}
EPGDnDArea >> returnStorypoints [
	
	| storypoint |
	self dropped select: [:morph | morph isEPGStorypoint] 
	thenDo: [:morph |
		storypoint := self pickUpMorph: morph.
		(storypoint hasProperty: #temporaryAdditional)
			ifTrue: [self game gameBoard temporaryStorypointArea dropInMorph: storypoint]
			ifFalse: [self game gameBoard regularStorypointArea dropInMorph: storypoint]].
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'sv 6/18/2024 13:31'
}
EPGDnDArea >> unfreeze [

	self pickUpEnabled: true.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'HCH 6/15/2024 22:30'
}
EPGDnDArea >> wantsDroppedMorph: aMorph event: evt [

	(self dropEnabled 
		and: [aMorph isEPGDnDMorph] 
		and: [self acceptsMorph: aMorph])
		ifFalse: [^ self rejectMorph].
	^ true.
]
