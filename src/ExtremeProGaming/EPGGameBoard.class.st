"
Basic game background which contains specific user interface components.
"
Class {
	#name : #EPGGameBoard,
	#superclass : #Morph,
	#instVars : [
		'game',
		'planningArea',
		'backlogArea',
		'reviewArea',
		'sprintingArea',
		'frontendDebtArea',
		'backendDebtArea',
		'storyPointAreas',
		'planningAreas',
		'featureScore',
		'doneAreas',
		'sprinter'
	],
	#category : 'ExtremeProGaming-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:03'
}
EPGGameBoard class >> areaExtentRatio [

	^ Dictionary newFrom: 
		{#planningBeginn -> (0 @ 0). #planningEnd -> (0.25 @ 1). 
		#backlogBeginn -> (0.25 @ 0). #backlogEnd -> (0.75 @ 1). 
		#reviewBeginn -> (0.75 @ 0). #reviewEnd -> (1 @ 1)}.
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
	#'squeak_changestamp' : 'sv 7/10/2024 00:08'
}
EPGGameBoard class >> defaultAmountBacklogAreas [

	^ 9.
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
	#'squeak_changestamp' : 'sv 7/10/2024 00:10'
}
EPGGameBoard class >> defaultAmountPlanningAreas [

	^ 3.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:13'
}
EPGGameBoard class >> defaultAmountStorypointAreas [

	^ 3.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:20'
}
EPGGameBoard class >> defaultBorderWidth [

	^ 5.
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
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 16:19'
}
EPGGameBoard class >> defaultFont [

	^ StrikeFont familyName: 'Bitmap DejaVu Sans' size: 30.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:00'
}
EPGGameBoard class >> defaultOffsets [

	^ 0 @ 0.
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
	#'squeak_changestamp' : 'HCH 7/12/2024 21:24'
}
EPGGameBoard class >> laneGroundColor [

	^ Color r: 0.5 g: 0 b: 0.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 7/12/2024 21:59'
}
EPGGameBoard class >> laneSeperatorColor [

	^ Color paleRed.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/10/2024 00:06'
}
EPGGameBoard class >> middleInset [

	^ 20.
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
	#'squeak_changestamp' : 'sv 7/10/2024 00:06'
}
EPGGameBoard class >> outerInset [

	^ 10.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:32'
}
EPGGameBoard class >> planningAreasAcceptance [

	^ #(#EPGEventCard #EPGFeatureCard #EPGBugCard).
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
	#category : #'dropping/grabbing',
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
	#category : #layouting,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 11:03'
}
EPGGameBoard >> addBacklogArea [

	self
		addMorph: self backlogArea
		fullFrame: (LayoutFrame
				fractions: ((self class areaExtentRatio at: #backlogBeginn)
						corner: (self class areaExtentRatio at: #backlogEnd))
				offsets: (self class defaultOffsets corner: self class defaultOffsets))
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 11:02'
}
EPGGameBoard >> addPlanningArea [

	self
		addMorph: self planningArea
		fullFrame: (LayoutFrame
				fractions: ((self class areaExtentRatio at: #planningBeginn)
						corner: (self class areaExtentRatio at: #planningEnd))
				offsets: (self class defaultOffsets corner: self class defaultOffsets)).
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 11:03'
}
EPGGameBoard >> addReviewArea [

	self
		addMorph: self reviewArea
		fullFrame: (LayoutFrame
				fractions: ((self class areaExtentRatio at: #reviewBeginn)
						corner: (self class areaExtentRatio at: #reviewEnd))
				offsets: (self class defaultOffsets corner: self class defaultOffsets)).
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'JA 7/11/2024 01:47'
}
EPGGameBoard >> addSprinter [
	
	self sprinter hide.
	self sprintingArea addMorph: self sprinter.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'JA 7/11/2024 01:48'
}
EPGGameBoard >> addSprintingArea [

    | sprintingAreaFrame parentHeight offset height |
    parentHeight := self height.
    offset := 10.
    height := 200.

    sprintingAreaFrame := LayoutFrame
        fractions: (0 @ 1 corner: 1 @ 1)
        offsets: (0 @ offset corner: 0 @ (offset + height)).

    self addMorph: self sprintingArea fullFrame: sprintingAreaFrame.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 11:04'
}
EPGGameBoard >> availableStorypointAreas [

	^ {self regularStorypointArea. self temporaryStorypointArea}.
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
	#'squeak_changestamp' : 'HCH 6/19/2024 19:56'
}
EPGGameBoard >> backlogDnDAreas [

	^ self backlogArea submorphs select: [:sub | sub isEPGDnDArea].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 11:04'
}
EPGGameBoard >> backlogImageFor: aNumber [

	^ ImageMorph new
		image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/BacklogAreas/BacklogArea', aNumber, '.png'))
		scaledToSize: EPGCard cardExtent).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:45'
}
EPGGameBoard >> bugArea [

	^ self planningAreas at: (self class planningAreasAcceptance indexOf: #EPGBugCard).
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'sv 7/10/2024 00:06'
}
EPGGameBoard >> createBacklogArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'backlog'.
	^ sectionMorph
		listDirection: #rightToLeft;
		listCentering: #center;
		wrapDirection: #bottomToTop;
		wrapCentering: #center;
		cellInset: self class middleInset;
		yourself.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'sv 7/10/2024 00:06'
}
EPGGameBoard >> createPlanningArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'planning'.
	^ sectionMorph
		listDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		cellInset: self class outerInset;
		layoutInset: self class outerInset;
		yourself.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'sv 7/10/2024 00:06'
}
EPGGameBoard >> createReviewArea [

	| sectionMorph |
	sectionMorph := self createSectionMorphFor: 'review'.
	^ sectionMorph
		listDirection: #bottomToTop;
		listCentering: #center;
		wrapCentering: #center;
		cellInset: self class outerInset;
		layoutInset: self class outerInset;
		yourself.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:20'
}
EPGGameBoard >> createSectionMorphFor: aName [

	^ Morph new
		color: self class sectionColor;
		borderWidth: self class defaultBorderWidth;
		borderColor: self class defaultColor;
		layoutPolicy: TableLayout new.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'JA 7/11/2024 01:34'
}
EPGGameBoard >> createSprinter [

	| animatedMorph |
	animatedMorph := (GitAssetLoader for: 'ExtremeProGaming') loadAnimatedImageMorph: 'assets/running_man_correct_direction.gif'.
	animatedMorph ifNil: [ 
        Error new: 'Failed to load animated sprinter'; signal. ].

	^ EPGSprinter newFrom: animatedMorph with: self sprintingArea.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'HCH 7/12/2024 21:25'
}
EPGGameBoard >> createSprintingArea [

	| lane1 lane2 lane3 sprintingArea |
	
	sprintingArea := Morph new extent: 2000 @ 200; color: self class laneGroundColor.

	lane1 := self createSprintingLane: 45.
	lane2 := self createSprintingLane: 95.
	lane3 := self createSprintingLane: 145.

	^ sprintingArea 
		addMorph: lane1;
		addMorph: lane2;
		addMorph: lane3;
		clipSubmorphs: true;
		yourself.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'HCH 7/12/2024 21:59'
}
EPGGameBoard >> createSprintingLane: anOffset [

	^ Morph new extent: 2000 @ 10; color: self class laneSeperatorColor; position: 0 @ anOffset.
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
	#'squeak_changestamp' : 'HCH 6/23/2024 14:33'
}
EPGGameBoard >> eventArea [

	^ self planningAreas at: (self class planningAreasAcceptance indexOf: #EPGEventCard).
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'JP 6/17/2024 14:33'
}
EPGGameBoard >> extent: aPoint [

	super extent: (aPoint max: self class boardExtent).
	(self backlogArea isNil) ifFalse: [self backlogArea extent: 0.5 * self extent]. "Fixes a layouting bug"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:45'
}
EPGGameBoard >> featureArea [

	^ self planningAreas at: (self class planningAreasAcceptance indexOf: #EPGFeatureCard).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 23:36'
}
EPGGameBoard >> featureScore [

	^ featureScore.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 23:36'
}
EPGGameBoard >> featureScore: aScore [

	featureScore := aScore.
]

{
	#category : #layouting,
	#'squeak_changestamp' : 'JP 6/17/2024 15:23'
}
EPGGameBoard >> fixLayout [

	self fullBounds. "Fixes a layouting bug"
	self backlogArea layoutChanged.
	self fullBounds.
]

{
	#category : #areas,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:36'
}
EPGGameBoard >> freezeDnD [

	| dndAreas |
	dndAreas := (self planningAreas), (self storyPointAreas), (self doneAreas).
	dndAreas do: [:area | area freeze.].
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
	#'squeak_changestamp' : 'JA 7/8/2024 21:16'
}
EPGGameBoard >> initialize [

	super initialize.
	
	self
		extent: self class boardExtent;
		color: self class defaultColor;
		layoutPolicy: ProportionalLayout new;
		initializeSectionMorphs;
		initializeSprinting;
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
	#'squeak_changestamp' : 'sv 7/10/2024 00:10'
}
EPGGameBoard >> initializeBacklogAreas [

	| area |
	1 to: self class defaultAmountBacklogAreas do:  [:a | 
		area := EPGBacklogArea new.
		area image: (self backlogImageFor: a);
			addMorph: area image;
			game: self game.
		area image center: area center.
		self  backlogArea addMorph: area].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 7/8/2024 21:10'
}
EPGGameBoard >> initializeButton [

	| button |
	button := SimpleButtonMorph new
			useRoundedCorners;
			label: 'Next Round' font: self class defaultFont;
			extent: self class buttonExtent;
			color: self class defaultColor;
			target: [self game finishSprint.];
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
	#'squeak_changestamp' : 'JP 6/19/2024 22:44'
}
EPGGameBoard >> initializeDoneAreas [	
	
	| wrapper featureArea bugArea |
	wrapper := self newWrapper.
	self reviewArea addMorph: wrapper.
	
	featureArea := self newDoneAreaAccepting: #EPGFeatureDone.
	wrapper addMorph: featureArea.
	
	bugArea :=  self newDoneAreaAccepting: #EPGBugDone.
	wrapper addMorph: bugArea.
	
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
	#'squeak_changestamp' : 'sv 7/10/2024 00:12'
}
EPGGameBoard >> initializePlanningAreas [

	| n area acceptedMorphs |
	n := self class defaultAmountPlanningAreas.
	self planningAreas: OrderedCollection new.
	n timesRepeat: [self planningAreas add: EPGPlanningArea new].
	acceptedMorphs := self class planningAreasAcceptance.
	
	1 to: n do:  [:a | 
		area := self planningAreas at: a.
		area
			image: (self planningImageFor: a);
	 		addMorph: area image;
			accepts: (Array with: (acceptedMorphs at: a)).
			
		area image center: area center.
		area game: self game.
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
	#'squeak_changestamp' : 'JA 7/11/2024 00:49'
}
EPGGameBoard >> initializeSprinting [

	self 
		sprintingArea: self createSprintingArea;
		sprinter: self createSprinter; 
		addSprintingArea;
		addSprinter.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/10/2024 00:13'
}
EPGGameBoard >> initializeStorypointAreas [

	| n wrapper area |
	n := self class defaultAmountStorypointAreas.
	wrapper := self newWrapper.
	self planningArea addMorph: wrapper.	
	
	self storyPointAreas: OrderedCollection new.
	n timesRepeat: [self storyPointAreas add: EPGStorypointArea new].
	1 to: n do: [:a |
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
	#category : #layouting,
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 12:37'
}
EPGGameBoard >> newDoneAreaAccepting: aSelector [
	
	^ EPGDnDArea new accepts: {aSelector asSymbol};
		dropEnabled: false;
		pickUpEnabled: false;
		initializeVisibleArea.

]

{
	#category : #layouting,
	#'squeak_changestamp' : 'JP 6/19/2024 22:43'
}
EPGGameBoard >> newWrapper [

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
	#'squeak_changestamp' : 'JP 7/8/2024 13:25'
}
EPGGameBoard >> planningAreas [

	^ planningAreas.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:04'
}
EPGGameBoard >> planningAreas: anObject [
	planningAreas := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 11:08'
}
EPGGameBoard >> planningImageFor: aNumber [

	^ ImageMorph new
		image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/PlanningAreas/PlanningArea', aNumber,'.png'))
		scaledToSize: EPGCard cardExtent).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:55'
}
EPGGameBoard >> regularStorypointArea [

	^ self storyPointAreas at: 
			(self class storyPointAreaTypes indexOf: #regular).
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
	#'squeak_changestamp' : 'JA 7/8/2024 21:09'
}
EPGGameBoard >> sprinter [

	^ sprinter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/11/2024 00:56'
}
EPGGameBoard >> sprinter: anAnimatedMorph [

	sprinter := anAnimatedMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/8/2024 21:09'
}
EPGGameBoard >> sprintingArea [

	^ sprintingArea.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 7/11/2024 00:55'
}
EPGGameBoard >> sprintingArea: aMorph [

	sprintingArea := aMorph.
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:55'
}
EPGGameBoard >> temporaryStorypointArea [

	^ self storyPointAreas at: 
			(self class storyPointAreaTypes indexOf: #temporaryAdditional).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:55'
}
EPGGameBoard >> unavailableStorypointArea [

	^ self storyPointAreas at: 
			(self class storyPointAreaTypes indexOf: #temporaryUnavailable).
]

{
	#category : #areas,
	#'squeak_changestamp' : 'HCH 6/23/2024 15:50'
}
EPGGameBoard >> unfreezeDnD [

	| DnDAreas |
	DnDAreas := (self planningAreas), (self availableStorypointAreas).
	DnDAreas remove: self eventArea.
	DnDAreas do: [:area | area unfreeze.].
]
