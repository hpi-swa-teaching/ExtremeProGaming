Class {
	#name : #EPGGameBoard,
	#superclass : #Morph,
	#instVars : [
		'planningArea',
		'backlogArea',
		'reviewArea',
		'frontendDebtArea',
		'backendDebtArea'
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
	#category : #positioning,
	#'squeak_changestamp' : 'JP 5/29/2024 22:01'
}
EPGGameBoard >> areaGap [

	^ 20.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 22:50'
}
EPGGameBoard >> backendDebtArea [
	^ backendDebtArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 22:50'
}
EPGGameBoard >> backendDebtArea: anObject [
	backendDebtArea := anObject
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
	#category : #positioning,
	#'squeak_changestamp' : 'JP 5/29/2024 22:11'
}
EPGGameBoard >> backlogAreaXOffset [

	^ 140.
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
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 22:50'
}
EPGGameBoard >> frontendDebtArea [
	^ frontendDebtArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 22:50'
}
EPGGameBoard >> frontendDebtArea: anObject [
	frontendDebtArea := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 20:44'
}
EPGGameBoard >> initialize [
	super initialize.
	
	self extent: self class boardExtent; 
		color: Color gray;
		initializeSectionMorphs;
		initializeStorypointAreas;
		initializePlanningAreas;
		initializeBacklogAreas;
		initializeDebtAreas;
		initializeDoneAreas.
		
	self startNewRound.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:12'
}
EPGGameBoard >> initializeBacklogAreas [

	| areas |
	
	1 to: 3 do:  [:a | 
		areas := OrderedCollection new.
		3 timesRepeat: [areas add: EPGBacklogArea new].
		1 to: 3 do: [:b | 
			| area point|
			area := areas at: b.
			point :=  self backlogArea position x  + ((b-1) * area extent x) + (b * self areaGap) + self backlogAreaXOffset @ (self yOffset + ((a - 1 )*  self areaGap) + ((a - 1)* area extent y)) .
			area position: self planningArea position + point.
			self addMorph: area]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:12'
}
EPGGameBoard >> initializeDebtAreas [	
	
	self frontendDebtArea: EPGDebtArea new.
	self frontendDebtArea position: self reviewArea position + ((self reviewAreaXOffset + 12) @ (self yOffset + 12));
		color: Color gray;
		type: #frontend;
		gameBoard: self.
	self addMorph: frontendDebtArea.
	
	self backendDebtArea: EPGDebtArea new.
	self backendDebtArea position: self reviewArea position + ((self reviewAreaXOffset + 12) @ (self yOffset + (3 * self areaGap) + self backendDebtArea extent y));
		color: Color gray;
		type: #backend;
		gameBoard: self.
	self addMorph: self backendDebtArea.
	
	self frontendDebtArea addTechnicalDebt.
	self backendDebtArea addTechnicalDebt.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:13'
}
EPGGameBoard >> initializeDoneAreas [	
	| area |
	
	area := self newDoneAreaAccepting: #EPGFeatureCard.
	area position: self reviewArea position + (self reviewAreaXOffset @ (self yOffset + (2* self areaGap) + (2*area extent y))).
	self addMorph: area.
	
	area :=  self newDoneAreaAccepting: #EPGBugCard.
	area position: self reviewArea position + (self reviewAreaXOffset +  area extent x @ (self yOffset + (2 * self areaGap) +  (2 * area extent y))).
	self addMorph: area.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:05'
}
EPGGameBoard >> initializePlanningAreas [

	| areas |

	areas := OrderedCollection new.
	
	3 timesRepeat: [areas add: EPGPlanningArea new].
	
	1 to: 3 do:  [:a | 
		| area point|
		area := areas at: a.
		point :=  self planningArea center x - (area extent x / 2) @ (self yOffset + ((a - 1 )*  self areaGap) + ((a - 1)* area extent y)) .
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
	#'squeak_changestamp' : 'JP 5/29/2024 22:15'
}
EPGGameBoard >> initializeStorypointAreas [

	| areas |

	areas := OrderedCollection new.

	3 timesRepeat: [areas add: EPGStorypointArea new].
	
	1 to: 3 do:  [:a | 
		| area point|
		area := areas at: a.
		point := (self storypointOffset + ((a - 1 ) *  self storypointGap) + ((a - 1)* area extent x)) @ self storypointOffset.
		area position: self planningArea position + point.
		(a == 1) 
			ifTrue: [area dropEnabled: false.]
			ifFalse: [area accepts: #(#EPGStorypoint)].
		area addAcceptanceToDroppedMorphs.
		self addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:03'
}
EPGGameBoard >> newDoneAreaAccepting: aSelector [
	
	^ EPGDnDArea new accepts: #(aSelector);
		initializeVisibleArea.

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

{
	#category : #positioning,
	#'squeak_changestamp' : 'JP 5/29/2024 22:12'
}
EPGGameBoard >> reviewAreaXOffset [

	^ 40.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 20:55'
}
EPGGameBoard >> startNewRound [

	self changed: #newRound with: nil.
	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'JP 5/29/2024 22:15'
}
EPGGameBoard >> storypointGap [

	^ 4.
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'JP 5/29/2024 22:14'
}
EPGGameBoard >> storypointOffset [

	^ 10.
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'JP 5/29/2024 22:05'
}
EPGGameBoard >> yOffset [

	^ 242.
]
