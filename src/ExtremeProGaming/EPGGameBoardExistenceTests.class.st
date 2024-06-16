Class {
	#name : #EPGGameBoardExistenceTests,
	#superclass : #MorphTest,
	#category : #ExtremeProGaming
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
	#'squeak_changestamp' : 'JA 5/16/2024 10:49'
}
EPGGameBoardExistenceTests >> testBackgroundCorrectPosition [
	
	self assert: morph position equals: 0 @ 0.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:45'
}
EPGGameBoardExistenceTests >> testBackgroundCorrectSize [
	
	self assert: morph extent equals: 1920 @ 1080.
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
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:27'
}
EPGGameBoardExistenceTests >> testCalculateAreaExtend [
	
	self
		assert: (morph calculateAreaExtendFor: 'planning') equals: (0.25 * 1920) @ 1080;
		assert: (morph calculateAreaExtendFor: 'backlog') equals: (0.5 * 1920) @ 1080;
		assert: (morph calculateAreaExtendFor: 'review') equals: (0.25 * 1920) @ 1080.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:27'
}
EPGGameBoardExistenceTests >> testCalculateAreaPosition [
	
	self
		assert: (morph calculateAreaPositionFor: 'planning') equals: 0 @ 0;
		assert: (morph calculateAreaPositionFor: 'backlog') equals: (1920 * 0.25) @ 0;
		assert: (morph calculateAreaPositionFor: 'review') equals: (1920 * 0.75) @ 0.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:27'
}
EPGGameBoardExistenceTests >> testSectionMorphsExistence [
	
	self
		assert: morph planningArea isMorph equals: true;
		assert: morph backlogArea isMorph equals: true;
		assert: morph reviewArea isMorph equals: true.
]
