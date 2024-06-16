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
		'planningAreas',
		'doneAreas',
		'game'
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
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:05'
}
EPGGameBoard class >> defaultColor [

	^ Color gray.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:24'
}
EPGGameBoard class >> doneAreaTypes [

	^ #(#Feature # Bug).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:03'
}
EPGGameBoard class >> newWithGame: aGame [

	^ self basicNew
					game: aGame;
					initialize.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 6/9/2024 16:34'
}
EPGGameBoard class >> planningAreasAcceptance [

	^ #(#EPGIterationCard #EPGFeatureCard #EPGBugCard).
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
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:26'
}
EPGGameBoard class >> storyPointAreaTypes [

	^ #(#temporaryUnavailable #regular #temporaryAdditional).
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
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 18:00'
}
EPGGameBoard >> doneAreas [

	^ doneAreas.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 18:01'
}
EPGGameBoard >> doneAreas: aCollection [

	doneAreas := aCollection.
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
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:00'
}
EPGGameBoard >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:00'
}
EPGGameBoard >> game: aGame [

	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:05'
}
EPGGameBoard >> initialize [

	super initialize.
	
	self
		extent: self class boardExtent; 
		color: self class defaultColor;
		initializeSectionMorphs;
		initializeStorypointAreas;
		initializePlanningAreas;
		initializeBacklogAreas;
		initializeDebtAreas;
		initializeDoneAreas;
		initializeButton.
		
		
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:27'
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
				position: self planningArea position + point.
			area image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/BacklogAreas/BacklogArea', a, b, '.png')) scaledToSize: 200 @ 250)).
			area addMorph: area image.
			area image center: area center.
			self addMorph: area]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:06'
}
EPGGameBoard >> initializeButton [

	| button |
	button := SimpleButtonMorph new
			useRoundedCorners;
			label: 'next round';
			extent: self class buttonExtent;
			position:  self reviewArea position + ((self class reviewAreaXOffset + 12) @ (self class yOffset + 12 - self class buttonExtent y - (4 * self class areaGap))); 
			color: self class defaultColor;
			target: [self game startNewRound];
			actionSelector: #value;
			yourself.
	
	self addMorph: button.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:11'
}
EPGGameBoard >> initializeDebtAreas [	
	
	self frontendDebtArea: (EPGDebtArea new
		position: self reviewArea position + ((self class reviewAreaXOffset + 12) @ (self class yOffset + 12));
		color: self class defaultColor;
		type: #frontend;
		game: self game).
	self addMorph: self frontendDebtArea.
	
	self backendDebtArea: EPGDebtArea new.
	self backendDebtArea
		position: self reviewArea position + ((self class reviewAreaXOffset + 12) @ (self class yOffset + (3 * self class areaGap) + self backendDebtArea extent y));
		color: self class defaultColor;
		type: #backend;
		game: self game.
	self addMorph: self backendDebtArea.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:35'
}
EPGGameBoard >> initializeDoneAreas [	
	
	| featureArea bugArea |
	featureArea := self newDoneAreaAccepting: #EPGFeatureDone.
	featureArea position: self reviewArea position + (self class reviewAreaXOffset @ (self class yOffset + (2 * self class areaGap) + (2 * featureArea extent y))).
	self addMorph: featureArea.
	
	bugArea :=  self newDoneAreaAccepting: #EPGBugDone.
	bugArea
		position: self reviewArea position + (self class reviewAreaXOffset + bugArea extent x @ (self class yOffset + (2 * self class areaGap) + (2 * bugArea extent y))).
	self addMorph: bugArea.
	
	self doneAreas: (OrderedCollection with: featureArea with: bugArea).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:34'
}
EPGGameBoard >> initializePlanningAreas [

	| area point acceptedMorphs |
	self planningAreas: OrderedCollection new.
	3 timesRepeat: [self planningAreas add: EPGPlanningArea new].
	acceptedMorphs := self class planningAreasAcceptance.
	
	1 to: 3 do:  [:a | 
		area := self planningAreas at: a.
		point :=  self planningArea center x - (area extent x / 2) @ (self class yOffset + ((a - 1) * self class areaGap) + ((a - 1) * area extent y)).
		area
			position: self planningArea position + point;
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
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:19'
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
			game: self game;
			addStorypoints: 3.
		(a == 1) 
			ifTrue: [area dropEnabled: false.]
			ifFalse: [area accepts: #(#EPGStorypoint)].
		self addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/15/2024 22:31'
}
EPGGameBoard >> newDoneAreaAccepting: aSelector [
	
	^ EPGDnDArea new accepts: {aSelector asSymbol};
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
