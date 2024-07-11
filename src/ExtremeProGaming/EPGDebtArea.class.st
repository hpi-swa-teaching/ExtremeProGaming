"
Defines area to display EPGTechnicalDebt in.
"
Class {
	#name : #EPGDebtArea,
	#superclass : #Morph,
	#instVars : [
		'game',
		'type',
		'currentDebt'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 10:54'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:41'
}
EPGDebtArea class >> defaultExtent [

	^ 375 @ 225.
]

{
	#category : #features,
	#'squeak_changestamp' : 'JP 6/19/2024 19:51'
}
EPGDebtArea >> addTechnicalDebt [

	| newDebt |
	newDebt := EPGDebt new.
	newDebt
		setType: self type;
		area: self;
		game: self game;
		addDependent: self game;
		position: (self randomPositionFor: newDebt).

	self addMorph: newDebt.
	self game addDependent: newDebt.
	self incrementDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:10'
}
EPGDebtArea >> currentDebt [

	^ currentDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:10'
}
EPGDebtArea >> currentDebt: aNumber [

	currentDebt := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:18'
}
EPGDebtArea >> decrementDebt [

	self currentDebt: self currentDebt - 1.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:30'
}
EPGDebtArea >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:30'
}
EPGDebtArea >> game: aGame [

	game := aGame.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:17'
}
EPGDebtArea >> incrementDebt [

	self currentDebt: self currentDebt + 1.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/9/2024 23:41'
}
EPGDebtArea >> initialize [ 

	super initialize.
	
	self 
		currentDebt: 0;
		color: EPGGameBoard defaultColor;
		extent: self class defaultExtent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 11:55'
}
EPGDebtArea >> isBlocking [

	^ self submorphs anySatisfy: [:debt | debt canBeProcessed].
]

{
	#category : #features,
	#'squeak_changestamp' : 'HCH 6/23/2024 11:56'
}
EPGDebtArea >> processDebt [

	self submorphsDo: [:debt | debt process.].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> randomPositionFor: aMorph [

	| range |
	range := self extent - aMorph extent.
	^ self position + ((0 to: range x) atRandom @ (0 to: range y) atRandom).
]

{
	#category : #features,
	#'squeak_changestamp' : 'sv 6/22/2024 20:50'
}
EPGDebtArea >> returnStorypoints [

	self submorphs do: [:debt | debt returnStorypoints.].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> type [

	^ type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> type: aType [

	type := aType.
]
