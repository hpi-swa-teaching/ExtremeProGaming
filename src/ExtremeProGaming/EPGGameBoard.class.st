Class {
	#name : #EPGGameBoard,
	#superclass : #Morph,
	#instVars : [
		'planningArea',
		'backlogArea',
		'reviewArea'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/21/2024 16:33'
}
EPGGameBoard class >> areaExtentRatio [

	^ Dictionary newFrom: {'planning' -> 0.25. 'backlog' -> 0.5. 'review' -> 0.25}.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/21/2024 16:37'
}
EPGGameBoard class >> areaPositionRatio [

	| backlogPosition reviewPosition |
	backlogPosition := self areaExtentRatio at: 'planning'.
	reviewPosition := (self areaExtentRatio at: 'backlog') + backlogPosition.

	^ Dictionary newFrom: {'planning' -> 0. 'backlog' -> backlogPosition. 'review' -> reviewPosition}.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/16/2024 10:48'
}
EPGGameBoard class >> boardExtent [

	^ 1920 @ 1080.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoard >> aboutToBeGrabbedBy: aHand [

	self submorphs do: 
		[:sub | (sub isEPGDnDArea 
				and: [sub intersects: aHand bounds]) 
				ifTrue: [^ sub aboutToBeGrabbedBy: aHand]].
	^ super aboutToBeGrabbedBy: aHand.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoard >> backlogArea [

	^ backlogArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoard >> backlogArea: aMorph [

	backlogArea := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 16:33'
}
EPGGameBoard >> calculateAreaExtendFor: aName [

	^ (self extent x * self class areaExtentRatio at: aName) @ self extent y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 16:34'
}
EPGGameBoard >> calculateAreaPositionFor: aName [

	^ (self position x + ((self class areaPositionRatio at: aName) * self extent x)) @ self position y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 16:30'
}
EPGGameBoard >> createSectionMorphFor: aName [

	| sectionMorph |
	sectionMorph := Morph new extent: (self calculateAreaExtendFor: aName);
			position: (self calculateAreaPositionFor: aName);
			color: Color darkGray;
			borderWidth: 5;
			borderColor: Color lightGray.

	self addMorph: sectionMorph.
	
	^ sectionMorph.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 12:41'
}
EPGGameBoard >> initialize [
	super initialize.
	
	self extent: self class boardExtent; 
		color: Color gray;
		initializeSectionMorphs;
		initializeStorypointAreas;
		initializeBacklogAreas.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 12:43'
}
EPGGameBoard >> initializeBacklogAreas [

	| areas |

	areas := OrderedCollection new.
	
	3 timesRepeat: [areas add: EPGBacklogArea new].
	
	1 to: 3 do:  [:a | 
		| area point|
		area := areas at: a.
		point :=  self planningArea center x - (area extent x / 2) @ (260 + ((a - 1 )*  20) + ((a - 1)* area extent y)) .
		area position: self planningArea position + point.
		self addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JA 5/21/2024 15:55'
}
EPGGameBoard >> initializeSectionMorphs [

	self planningArea: (self createSectionMorphFor: 'planning');
		backlogArea: (self createSectionMorphFor: 'backlog');
		reviewArea:  (self createSectionMorphFor: 'review').
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/29/2024 19:53'
}
EPGGameBoard >> initializeStorypointAreas [

	| areas |

	areas := OrderedCollection new.
	
	3 timesRepeat: [areas add: EPGStorypointArea new].
	
	1 to: 3 do:  [:a | 
		| area point|
		area := areas at: a.
		point := (10 + ((a - 1 )*  4) + ((a - 1)* area extent x)) @ 10.
		area position: self planningArea position + point.
		(a == 1) 
			ifTrue: [area accepts: #(#temporaryUnavailable)]
			ifFalse: [area accepts: #(#available)].
		area addAcceptanceToDroppedMorphs.
		self addMorph: area].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoard >> planningArea [

	^ planningArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:11'
}
EPGGameBoard >> planningArea: aMorph [

	planningArea := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:11'
}
EPGGameBoard >> reviewArea [

	^ reviewArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:11'
}
EPGGameBoard >> reviewArea: aMorph [

	reviewArea := aMorph.
]
