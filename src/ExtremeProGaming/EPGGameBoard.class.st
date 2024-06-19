Class {
	#name : #EPGGameBoard,
	#superclass : #Morph,
	#instVars : [
		'game',
		'planningArea',
		'backlogArea',
		'reviewArea',
		'frontendDebtArea',
		'backendDebtArea',
		'storyPointAreas',
		'planningAreas',
		'featureScore',
		'doneAreas'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JP 6/17/2024 14:02'
}
EPGGameBoard class >> areaExtentRatio [

	^ Dictionary newFrom: {#planningBeginn -> 0. #planningEnd -> 0.25. #backlogBeginn -> 0.25. #backlogEnd -> 0.75. #reviewBeginn -> 0.75. #reviewEnd -> 1}.
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
	#'squeak_changestamp' : 'JP 6/17/2024 14:28'
}
EPGGameBoard class >> boardExtent [

	^ 2000 @ 1310.
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
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 23:09'
}
EPGGameBoard class >> defaultAmountOfStorypoints [

	^ 3.
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
	#'squeak_changestamp' : 'JP 6/17/2024 15:19'
}
EPGGameBoard class >> sectionColor [

	^ Color darkGray.
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
	#'squeak_changestamp' : 'HCH 6/14/2024 00:18'
}
EPGGameBoard >> aboutToBeGrabbedBy: aHand [

	self allMorphs do: 
		[:sub | (sub isEPGDnDArea 
				and: [sub intersects: aHand bounds]) 
				ifTrue: [^ sub aboutToBeGrabbedBy: aHand]].
	^ super aboutToBeGrabbedBy: aHand.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 20:26'
}
EPGGameBoard >> addBacklogArea [

	self addMorph: self backlogArea fullFrame: (LayoutFrame fractions: ((self class areaExtentRatio at: #backlogBeginn) @ 0 corner: ((self class areaExtentRatio at: #backlogEnd) @ 1)) offsets: (0 @ 0 corner: 0 @ 0)).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 20:26'
}
EPGGameBoard >> addPlanningArea [

	self addMorph: self planningArea fullFrame: (LayoutFrame fractions: ((self class areaExtentRatio at: #planningBeginn) @ 0 corner: ((self class areaExtentRatio at: #planningEnd) @ 1)) offsets: (0 @ 0 corner: 0 @ 0)).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 20:26'
}
EPGGameBoard >> addReviewArea [

	self addMorph: self reviewArea fullFrame: (LayoutFrame fractions: ((self class areaExtentRatio at: #reviewBeginn) @ 0 corner: ((self class areaExtentRatio at: #reviewEnd) @ 1)) offsets: (0 @ 0 corner: 0 @ 0)).
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
	#'squeak_changestamp' : 'JP 6/17/2024 15:35'
}
EPGGameBoard >> createBacklogArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'backlog'.
	^ sectionMorph
		listDirection: #rightToLeft;
		listCentering: #center;
		wrapDirection: #bottomToTop;
		wrapCentering: #center;
		cellInset: 20;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/17/2024 15:41'
}
EPGGameBoard >> createPlanningArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'planning'.
	^ sectionMorph
		listDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		cellInset: 10;
		layoutInset: 10;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/17/2024 15:38'
}
EPGGameBoard >> createReviewArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'review'.
	^ sectionMorph
		listDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		cellInset: 10;
		layoutInset: 10;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/17/2024 15:21'
}
EPGGameBoard >> createSectionMorphFor: aName [

	^ Morph new
		color: self class sectionColor;
		borderWidth: 5;
		borderColor: self class defaultColor;
		layoutPolicy: TableLayout new.
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
	#'squeak_changestamp' : 'JP 6/17/2024 14:33'
}
EPGGameBoard >> extent: aPoint [

	super extent: (aPoint max: self class boardExtent).
	(self backlogArea isNil) ifFalse: [self backlogArea extent: 0.5 * self extent]. "Fixes a layouting bug"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 22:37'
}
EPGGameBoard >> featureScore [
	^ featureScore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 22:37'
}
EPGGameBoard >> featureScore: anObject [
	featureScore := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/17/2024 15:23'
}
EPGGameBoard >> fixLayout [

	self fullBounds. "Fixes a layouting bug"
	self backlogArea layoutChanged.
	self fullBounds.
]

{
	#category : #areas,
	#'squeak_changestamp' : 'sv 6/18/2024 11:21'
}
EPGGameBoard >> freezeDnD [

	| DnDAreas |
	DnDAreas := (self planningAreas), (self storyPointAreas), (self doneAreas).
	DnDAreas do: [:area | area freeze.].
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
	#'squeak_changestamp' : 'JP 6/19/2024 22:06'
}
EPGGameBoard >> initialize [

	super initialize.
	
	self
		extent: self class boardExtent;
		color: self class defaultColor;
		layoutPolicy: ProportionalLayout new;
		initializeSectionMorphs;
		initializeStorypointAreas;
		initializePlanningAreas;
		initializeBacklogAreas;
		initializeButton;
		initializeDebtAreas;
		initializeFeatureScore;
		initializeDoneAreas;
		fixLayout.
		
		
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 23:05'
}
EPGGameBoard >> initializeBacklogAreas [

	| area |
	1 to: 9 do:  [:a | 
		area := EPGBacklogArea new.
		area image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/BacklogAreas/BacklogArea', a, '.png')) scaledToSize: EPGCard cardExtent));
			addMorph: area image.
		area image center: area center.
		self  backlogArea addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/17/2024 15:17'
}
EPGGameBoard >> initializeButton [

	| button |
	button := SimpleButtonMorph new
			useRoundedCorners;
			label: 'next round';
			extent: self class buttonExtent;
			color: self class defaultColor;
			target: [self game startNewRound];
			actionSelector: #value;
			yourself.
	
	self reviewArea addMorph: button.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/17/2024 15:31'
}
EPGGameBoard >> initializeDebtAreas [	
	
	self frontendDebtArea: EPGDebtArea new.
	self frontendDebtArea
		type: #frontend;
		game: self game.
	self reviewArea addMorph: self frontendDebtArea.
	
	self backendDebtArea: EPGDebtArea new.
	self backendDebtArea
		type: #backend;
		game: self game.
	self reviewArea  addMorph: self backendDebtArea.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/17/2024 15:12'
}
EPGGameBoard >> initializeDoneAreas [	
	
	| featureArea bugArea |
	featureArea := self newDoneAreaAccepting: #EPGFeatureDone.
	self reviewArea addMorph: featureArea.
	
	bugArea :=  self newDoneAreaAccepting: #EPGBugDone.
	self reviewArea addMorph: bugArea.
	
	self doneAreas: (OrderedCollection with: featureArea with: bugArea).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/19/2024 22:37'
}
EPGGameBoard >> initializeFeatureScore [
	
	self featureScore: EPGFeatureScore new.
	self reviewArea addMorph: self featureScore.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/17/2024 15:06'
}
EPGGameBoard >> initializePlanningAreas [

	| area acceptedMorphs |
	self planningAreas: OrderedCollection new.
	3 timesRepeat: [self planningAreas add: EPGPlanningArea new].
	acceptedMorphs := self class planningAreasAcceptance.
	
	1 to: 3 do:  [:a | 
		area := self planningAreas at: a.
		area
			image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/PlanningAreas/PlanningArea', a,'.png')) scaledToSize: EPGCard cardExtent));
	 		addMorph: area image;
			accepts: (Array with: (acceptedMorphs at: a)).
			
		area image center: area center.
		self planningArea addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 20:27'
}
EPGGameBoard >> initializeSectionMorphs [

	self
		planningArea: self createPlanningArea;
		backlogArea: self createBacklogArea;
		reviewArea: self createReviewArea;
		addPlanningArea;
		addBacklogArea;
		addReviewArea.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/19/2024 11:18'
}
EPGGameBoard >> initializeStorypointAreas [

	| wrapper area |
	wrapper := self newStorypointWrapper.
	self planningArea addMorph: wrapper.	
	
	self storyPointAreas: OrderedCollection new.
	3 timesRepeat: [self storyPointAreas add: EPGStorypointArea new].
	1 to: 3 do: [:a |
		area := self storyPointAreas at: a.
		area
			game: self game;
			addStorypoints: self class defaultAmountOfStorypoints.
		(a == 1) 
			ifTrue: [area dropEnabled: false; pickUpEnabled: false.]
			ifFalse: [area accepts: #(#EPGStorypoint)].
		wrapper addMorph: area].
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
	#'squeak_changestamp' : 'JP 6/19/2024 11:18'
}
EPGGameBoard >> newStorypointWrapper [

	^ Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #rightToLeft;
		listCentering: #justified;
		wrapCentering: #justified;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill.
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

{
	#category : #areas,
	#'squeak_changestamp' : 'sv 6/18/2024 11:21'
}
EPGGameBoard >> unfreezeDnD [

	| DnDAreas |
	DnDAreas := (self planningAreas), (self storyPointAreas), (self doneAreas).
	DnDAreas do: [:area | area unfreeze.].
]
