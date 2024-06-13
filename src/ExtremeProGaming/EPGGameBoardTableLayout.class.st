Class {
	#name : #EPGGameBoardTableLayout,
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
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards'
	],
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/21/2024 16:33'
}
EPGGameBoardTableLayout class >> areaExtentRatio [

	^ Dictionary newFrom: {'planning' -> 0.25. 'backlog' -> 0.5. 'review' -> 0.25}.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:44'
}
EPGGameBoardTableLayout class >> areaGap [

	^ 20.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/21/2024 16:37'
}
EPGGameBoardTableLayout class >> areaPositionRatio [

	| backlogPosition reviewPosition |
	backlogPosition := self areaExtentRatio at: 'planning'.
	reviewPosition := (self areaExtentRatio at: 'backlog') + backlogPosition.

	^ Dictionary newFrom: {'planning' -> 0. 'backlog' -> backlogPosition. 'review' -> reviewPosition}.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:46'
}
EPGGameBoardTableLayout class >> backlogAreaXOffset [

	^ 140.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JA 5/16/2024 10:48'
}
EPGGameBoardTableLayout class >> boardExtent [

	^ 1920 @ 1080.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Philipp 6/6/2024 22:34'
}
EPGGameBoardTableLayout class >> buttonExtent [

	^ 375 @ 100.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:24'
}
EPGGameBoardTableLayout class >> doneAreaTypes [

	^ #(#Feature # Bug).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 6/9/2024 16:34'
}
EPGGameBoardTableLayout class >> planningAreasAcceptance [

	^ #(#EPGIterationCard #EPGFeatureCard #EPGBugCard).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:48'
}
EPGGameBoardTableLayout class >> reviewAreaXOffset [

	^ 40.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:26'
}
EPGGameBoardTableLayout class >> storyPointAreaTypes [

	^ #(#temporaryUnavailable #regular #temporaryAdditional).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:52'
}
EPGGameBoardTableLayout class >> storypointGap [

	^ 4.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:51'
}
EPGGameBoardTableLayout class >> storypointOffset [

	^ 10.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:50'
}
EPGGameBoardTableLayout class >> yOffset [

	^ 242.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoardTableLayout >> aboutToBeGrabbedBy: aHand [

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
EPGGameBoardTableLayout >> backendDebtArea [

	^ backendDebtArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:16'
}
EPGGameBoardTableLayout >> backendDebtArea: aDebtArea [

	backendDebtArea := aDebtArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoardTableLayout >> backlogArea [

	^ backlogArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoardTableLayout >> backlogArea: aMorph [

	backlogArea := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 22:37'
}
EPGGameBoardTableLayout >> calculateAreaExtendFor: aName [

	^ ((self extent x * self class areaExtentRatio at: aName) @ self extent y) - (2 * self sectionPadding).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/21/2024 16:34'
}
EPGGameBoardTableLayout >> calculateAreaPositionFor: aName [

	^ (self position x + ((self class areaPositionRatio at: aName) * self extent x)) @ self position y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 15:45'
}
EPGGameBoardTableLayout >> cardSource [

	^ cardSource.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 15:46'
}
EPGGameBoardTableLayout >> cardSource: anEPGJSONParser [

	cardSource := anEPGJSONParser.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 23:29'
}
EPGGameBoardTableLayout >> createBacklogArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'backlog'.
	sectionMorph
		listDirection: #rightToLeft;
		wrapDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		layoutInset: ((sectionMorph extent y - (3 * EPGCard cardExtent y)) / 2) @ 0;
		"layoutInset: 200;"
		cellInset: 20.

	self addMorph: sectionMorph.
	^ sectionMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 23:30'
}
EPGGameBoardTableLayout >> createPlanningArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'planning'.
	sectionMorph
		listDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		cellInset: 10;
		layoutInset: 10.

	self addMorph: sectionMorph.
	^ sectionMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 23:40'
}
EPGGameBoardTableLayout >> createReviewArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'review'.
	sectionMorph
		listDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		cellInset: 10;
		layoutInset: 10.

	self addMorph: sectionMorph.
	^ sectionMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 23:11'
}
EPGGameBoardTableLayout >> createSectionMorphFor: aName [

	^ Morph new
		color: Color darkGray;
		extent: (self calculateAreaExtendFor: aName);
		vResizing: #spaceFill;
		layoutPolicy: TableLayout new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 18:00'
}
EPGGameBoardTableLayout >> doneAreas [

	^ doneAreas.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 18:01'
}
EPGGameBoardTableLayout >> doneAreas: aCollection [

	doneAreas := aCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:47'
}
EPGGameBoardTableLayout >> frontendDebtArea [

	^ frontendDebtArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:47'
}
EPGGameBoardTableLayout >> frontendDebtArea: aDebtArea [

	frontendDebtArea := aDebtArea.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'sv 6/9/2024 16:36'
}
EPGGameBoardTableLayout >> generateBugCards [

	| index |
	index := self class planningAreasAcceptance indexOf: #EPGBugCard.
	self cardSource bugCards do: [:card |
		card gameBoard: self.
		self addDependent: card.
		(self planningAreas at: index) dropInMorph: card].
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:39'
}
EPGGameBoardTableLayout >> generateCards [

	| parser |
	parser := self cardSource.
	parser createCards.
	
	self 
		numOfFeatureCards: parser featureCards size;
		numOfBugCards: parser bugCards size;
		generateFeatureCards;
		generateBugCards.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'sv 6/9/2024 16:37'
}
EPGGameBoardTableLayout >> generateFeatureCards [

	| index |
	index := self class planningAreasAcceptance indexOf: #EPGFeatureCard.
	self cardSource featureCards do: [:card |
		card gameBoard: self.
		self addDependent: card.
		(self planningAreas at: index) dropInMorph: card].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:38'
}
EPGGameBoardTableLayout >> initialize [

	super initialize.
	
	self
		extent: self class boardExtent;
		color: Color gray;
		cardSource: EPGJSONParser new;
		initializeTableLayout;
		initializeSectionMorphs;
		initializeStorypointAreas;
		initializePlanningAreas;
		initializeBacklogAreas;
		initializeButton;
		initializeDebtAreas;
		initializeDoneAreas;
		generateCards.
		
		
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:18'
}
EPGGameBoardTableLayout >> initializeBacklogAreas [

	| areas area |
	1 to: 3 do:  [:a | 
		areas := OrderedCollection new.
		3 timesRepeat: [areas add: EPGBacklogArea new].
		1 to: 3 do: [:b |
			area := areas at: b.
			area
				gameBoard: self.
			area image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/BacklogAreas/BacklogArea', a, b, '.png')) scaledToSize: EPGCard cardExtent)).
			area addMorph: area image.
			area image center: area center.
			self backlogArea addMorph: area]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:38'
}
EPGGameBoardTableLayout >> initializeButton [

	| button |
	button := SimpleButtonMorph new
			useRoundedCorners;
			label: 'next round';
			extent: self class buttonExtent;
			color: Color gray;
			target: [self startNewRound];
			actionSelector: #value;
			yourself.
	
	self reviewArea addMorph: button.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:35'
}
EPGGameBoardTableLayout >> initializeDebtAreas [	
	
	self frontendDebtArea: EPGDebtArea new.
	self frontendDebtArea
		color: Color gray;
		type: #frontend;
		gameBoard: self.
	self reviewArea addMorph: frontendDebtArea.
	
	self backendDebtArea: EPGDebtArea new.
	self backendDebtArea
		color: Color gray;
		type: #backend;
		gameBoard: self.
	self reviewArea  addMorph: self backendDebtArea.
	

	self frontendDebtArea addTechnicalDebt.
	self backendDebtArea addTechnicalDebt.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:38'
}
EPGGameBoardTableLayout >> initializeDoneAreas [	
	
	| featureArea bugArea |
	featureArea := self newDoneAreaAccepting: #EPGFeatureCard.
	self reviewArea addMorph: featureArea.
	
	bugArea :=  self newDoneAreaAccepting: #EPGBugCard.
	bugArea gameBoard: self.
	self reviewArea addMorph: bugArea.
	
	self doneAreas: (OrderedCollection with: featureArea with: bugArea).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:15'
}
EPGGameBoardTableLayout >> initializePlanningAreas [

	| area acceptedMorphs |
	self planningAreas: OrderedCollection new.
	3 timesRepeat: [self planningAreas add: EPGPlanningArea new].
	acceptedMorphs := self class planningAreasAcceptance.
	
	1 to: 3 do:  [:a | 
		area := self planningAreas at: a.
		area
			gameBoard: self;
			image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/PlanningAreas/PlanningArea', a,'.png')) scaledToSize: EPGCard cardExtent));
	 		addMorph: area image;
			accepts: (Array with: (acceptedMorphs at: a)).
			
		area image center: area center.
		self planningArea addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:10'
}
EPGGameBoardTableLayout >> initializeSectionMorphs [

	self
		reviewArea: self createReviewArea;
		backlogArea: self createBacklogArea;
		planningArea: self createPlanningArea.
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/13/2024 23:01'
}
EPGGameBoardTableLayout >> initializeStorypointAreas [

	| wrapper area |
		
	wrapper := self newStorypointWrapper.
	self planningArea addMorph: wrapper.	
		
	self storyPointAreas: OrderedCollection new.
	3 timesRepeat: [self storyPointAreas add: EPGStorypointArea new].
	1 to: 3 do: [:a |
		area := self storyPointAreas at: a.
		area
			gameBoard: self;
			addStorypoints: 3.
		(a == 1) 
			ifTrue: [area dropEnabled: false.]
			ifFalse: [area accepts: #(#EPGStorypoint)].
		wrapper addMorph: area].
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'JP 6/13/2024 22:51'
}
EPGGameBoardTableLayout >> initializeTableLayout [

	self
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: self sectionPadding;
		minCellSize: 0 @ (self class boardExtent  - self sectionPadding) y.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:03'
}
EPGGameBoardTableLayout >> newDoneAreaAccepting: aSelector [
	
	^ EPGDnDArea new accepts: #(aSelector);
		initializeVisibleArea.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 23:13'
}
EPGGameBoardTableLayout >> newStorypointWrapper [

	^ Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		listCentering: #justified;
		wrapCentering: #justified;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 16:11'
}
EPGGameBoardTableLayout >> numOfBugCards [

	^ numOfBugCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 16:11'
}
EPGGameBoardTableLayout >> numOfBugCards: aNumber [

	numOfBugCards := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 16:11'
}
EPGGameBoardTableLayout >> numOfFeatureCards [

	^ numOfFeatureCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 16:11'
}
EPGGameBoardTableLayout >> numOfFeatureCards: aNumber [

	numOfFeatureCards := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:10'
}
EPGGameBoardTableLayout >> planningArea [

	^ planningArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:11'
}
EPGGameBoardTableLayout >> planningArea: aMorph [

	planningArea := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:04'
}
EPGGameBoardTableLayout >> planningAreas [
	^ planningAreas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:04'
}
EPGGameBoardTableLayout >> planningAreas: anObject [
	planningAreas := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:11'
}
EPGGameBoardTableLayout >> reviewArea [

	^ reviewArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:11'
}
EPGGameBoardTableLayout >> reviewArea: aMorph [

	reviewArea := aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/13/2024 22:36'
}
EPGGameBoardTableLayout >> sectionPadding [
	
	^ 5 @ 5.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:11'
}
EPGGameBoardTableLayout >> startNewRound [

	self changed: #newRound.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 15:46'
}
EPGGameBoardTableLayout >> storyPointAreas [

	^ storyPointAreas.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 15:47'
}
EPGGameBoardTableLayout >> storyPointAreas: aCollection [

	storyPointAreas := aCollection.
]
