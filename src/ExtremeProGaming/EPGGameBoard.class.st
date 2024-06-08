Class {
	#name : #EPGGameBoard,
	#superclass : #Morph,
	#instVars : [
		'planningArea',
		'backlogArea',
		'reviewArea',
		'frontendDebtArea',
		'backendDebtArea',
		'storyPointAreas',
		'planningAreas'
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
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:44'
}
EPGGameBoard class >> areaGap [

	^ 20.
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
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:46'
}
EPGGameBoard class >> backlogAreaXOffset [

	^ 140.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/16/2024 10:48'
}
EPGGameBoard class >> boardExtent [

	^ 1920 @ 1080.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/6/2024 22:34'
}
EPGGameBoard class >> buttonExtent [

	^ 375 @ 100.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:48'
}
EPGGameBoard class >> reviewAreaXOffset [

	^ 40.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:52'
}
EPGGameBoard class >> storypointGap [

	^ 4.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:51'
}
EPGGameBoard class >> storypointOffset [

	^ 10.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:50'
}
EPGGameBoard class >> yOffset [

	^ 242.
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
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:15'
}
EPGGameBoard >> backendDebtArea [

	^ backendDebtArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:16'
}
EPGGameBoard >> backendDebtArea: aDebtArea [

	backendDebtArea := aDebtArea.
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
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:47'
}
EPGGameBoard >> createSectionMorphFor: aName [

	| sectionMorph |
	sectionMorph := Morph new.
	sectionMorph
		extent: (self calculateAreaExtendFor: aName);
		position: (self calculateAreaPositionFor: aName);
		color: Color darkGray;
		borderWidth: 5;
		borderColor: Color lightGray.

	self addMorph: sectionMorph.
	^ sectionMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:47'
}
EPGGameBoard >> frontendDebtArea [

	^ frontendDebtArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:47'
}
EPGGameBoard >> frontendDebtArea: aDebtArea [

	frontendDebtArea := aDebtArea.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:18'
}
EPGGameBoard >> generateCards [

	| card cardTypes |
	cardTypes := #(#EPGFeatureCard EPGBugCard).
	2 to: 3 do: [:areaNumber | 
		3 timesRepeat: [
			card := (Smalltalk at: (cardTypes at: (areaNumber - 1)))
				newBackendWithTask: 'Server schmiert ab' 
				consequence: 'Ihr habt nebenbei 10 sleep statements entfernt und die App dadurch schneller gemacht' 
				effect: 'Harald gönnt fetten Bonus, ihr habt 3 Story points mehr durch Motivation' 
				cost: 3 perTechnicalDebt: 1 
				positive: true.
			card gameBoard: self.
			self addDependent: card.
			(self planningAreas at: areaNumber) dropInMorph: card
		]
	]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/6/2024 22:18'
}
EPGGameBoard >> initialize [

	super initialize.
	
	self
		extent: self class boardExtent; 
		color: Color gray;
		initializeSectionMorphs;
		initializeStorypointAreas;
		initializePlanningAreas;
		initializeBacklogAreas;
		initializeDebtAreas;
		initializeDoneAreas;
		initializeButtons.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:31'
}
EPGGameBoard >> initializeBacklogAreas [

	| areas area point |
	1 to: 3 do:  [:a | 
		areas := OrderedCollection new.
		3 timesRepeat: [areas add: EPGBacklogArea new].
		1 to: 3 do: [:b |
			area := areas at: b.
			point :=  self backlogArea position x  + ((b - 1) * area extent x) + (b * self class areaGap) + self class backlogAreaXOffset @ (self class yOffset + ((a - 1) * self class areaGap) + ((a - 1) * area extent y)) .
			area
				position: self planningArea position + point;
				gameBoard: self.
			area image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/BacklogAreas/BacklogArea', a, b, '.png')) scaledToSize: 200 @ 250)).
			area addMorph: area image.
			area image center: area center.
			self addMorph: area]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:31'
}
EPGGameBoard >> initializeButtons [

	| button |
	button := SimpleButtonMorph new
			useRoundedCorners;
			label: 'next round';
			extent: self class buttonExtent;
			position:  self reviewArea position + ((self class reviewAreaXOffset + 12) @ (self class yOffset + 12 - self class buttonExtent y - (4 * self class areaGap))); 
			color: Color gray;
			target: [self startNewRound];
			actionSelector: #value;
			yourself.
	
	self addMorph: button.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:54'
}
EPGGameBoard >> initializeDebtAreas [	
	
	self frontendDebtArea: EPGDebtArea new.
	self frontendDebtArea
		position: self reviewArea position + ((self class reviewAreaXOffset + 12) @ (self class yOffset + 12));
		color: Color gray;
		type: #frontend;
		gameBoard: self.
	self addMorph: frontendDebtArea.
	
	self backendDebtArea: EPGDebtArea new.
	self backendDebtArea
		position: self reviewArea position + ((self class reviewAreaXOffset + 12) @ (self class yOffset + (3 * self class areaGap) + self backendDebtArea extent y));
		color: Color gray;
		type: #backend;
		gameBoard: self.
	self addMorph: self backendDebtArea.
	
	self frontendDebtArea addTechnicalDebt.
	self backendDebtArea addTechnicalDebt.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:30'
}
EPGGameBoard >> initializeDoneAreas [	
	| area |
	
	area := self newDoneAreaAccepting: #EPGFeatureCard.
	area position: self reviewArea position + (self class reviewAreaXOffset @ (self class yOffset + (2 * self class areaGap) + (2 * area extent y))).
	self addMorph: area.
	
	area :=  self newDoneAreaAccepting: #EPGBugCard.
	area
		position: self reviewArea position + (self class reviewAreaXOffset + area extent x @ (self class yOffset + (2 * self class areaGap) + (2 * area extent y)));
		gameBoard: self.
	self addMorph: area.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:30'
}
EPGGameBoard >> initializePlanningAreas [

	| area point acceptedMorphs |
	self planningAreas: OrderedCollection new.
	3 timesRepeat: [self planningAreas add: EPGPlanningArea new].
	acceptedMorphs := #(#EPGIterationCard #EPGFeatureCard #EPGBugCard).
	
	1 to: 3 do:  [:a | 
		area := self planningAreas at: a.
		point :=  self planningArea center x - (area extent x / 2) @ (self class yOffset + ((a - 1) * self class areaGap) + ((a - 1) * area extent y)).
		area
			position: self planningArea position + point;
			gameBoard: self;
			image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/PlanningAreas/PlanningArea', a,'.png')) scaledToSize: 200 @ 250));
	 		addMorph: area image;
			accepts: (Array with: (acceptedMorphs at: a)).
			
		area image center: area center.
		self addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/29/2024 23:19'
}
EPGGameBoard >> initializeSectionMorphs [

	self
		planningArea: (self createSectionMorphFor: 'planning');
		backlogArea: (self createSectionMorphFor: 'backlog');
		reviewArea:  (self createSectionMorphFor: 'review').
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:45'
}
EPGGameBoard >> initializeStorypointAreas [

	| area point |
	self storyPointAreas: OrderedCollection new.
	3 timesRepeat: [self storyPointAreas add: EPGStorypointArea new].
	1 to: 3 do: [:a |
		area := self storyPointAreas at: a.
		point := (self class storypointOffset + ((a - 1) * self class storypointGap) + ((a - 1) * area extent x)) @ self class storypointOffset.
		area
			position: self planningArea position + point;
			gameBoard: self;
			addStorypoints: 3.
		(a == 1) 
			ifTrue: [area dropEnabled: false.]
			ifFalse: [area accepts: #(#EPGStorypoint)].
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
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:04'
}
EPGGameBoard >> planningAreas [
	^ planningAreas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:04'
}
EPGGameBoard >> planningAreas: anObject [
	planningAreas := anObject
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
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:11'
}
EPGGameBoard >> startNewRound [

	self changed: #newRound.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 15:46'
}
EPGGameBoard >> storyPointAreas [

	^ storyPointAreas.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 15:47'
}
EPGGameBoard >> storyPointAreas: aCollection [

	storyPointAreas := aCollection.
]
