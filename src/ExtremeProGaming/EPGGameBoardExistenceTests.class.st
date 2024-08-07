"
Tests if the game is correctly initialized.
"
Class {
	#name : #EPGGameBoardExistenceTests,
	#superclass : #MorphTest,
	#category : #'ExtremeProGaming-Tests',
	#'squeak_changestamp' : 'JP 7/8/2024 13:15'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:13'
}
EPGGameBoardExistenceTests >> setUp [

	morph := EPGGame new.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JP 6/17/2024 19:10'
}
EPGGameBoardExistenceTests >> testBackgroundCorrectExtent [
	
	self assert: morph extent equals: 2000 @ 1310.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:49'
}
EPGGameBoardExistenceTests >> testBackgroundCorrectPosition [
	
	self assert: morph position equals: 0 @ 0.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:33'
}
EPGGameBoardExistenceTests >> testBackgroundMorphExistence [
	
	self assert: morph isMorph equals: true.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:36'
}
EPGGameBoardExistenceTests >> testBackgroundMorphOpened [
	
	self shouldnt: morph openInWorld raise: Error.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JP 6/17/2024 19:11'
}
EPGGameBoardExistenceTests >> testCalculateAreaExtent [
	
	self assert: (morph planningArea extent) equals: (0.25 * 2000) @ 1310.
	self assert: (morph backlogArea extent) equals: (0.5 * 2000) @ 1310.
	self assert: (morph reviewArea extent) equals: (0.25 * 2000) @ 1310.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JP 6/17/2024 19:12'
}
EPGGameBoardExistenceTests >> testCalculateAreaPosition [
	
	self assert: (morph planningArea position) equals: 0 @ 0.
	self assert: (morph backlogArea position) equals: (2000*0.25) @ 0.
	self assert: (morph reviewArea position) equals: (2000*0.75) @ 0.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 7/7/2024 19:44'
}
EPGGameBoardExistenceTests >> testCreationSprintingArea [

	|sprintingArea|
	sprintingArea := morph createSprintingArea.
	
	self assert: sprintingArea extent equals: 2000@200.
	self assert: sprintingArea submorphs size equals: 3.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 23:10'
}
EPGGameBoardExistenceTests >> testSectionMorphsExistence [
	
	self assert: morph planningArea isMorph equals: true.
	self assert: morph backlogArea isMorph equals: true.
	self assert: morph reviewArea isMorph equals: true.
]
