Class {
	#name : #EPGGameBoardExistenceTests,
	#superclass : #MorphTest,
	#category : #ExtremeProGaming
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'JA 5/16/2024 11:35'
}
EPGGameBoardExistenceTests >> setUp [

	morph := EPGGameBoard new.
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
	#'squeak_changestamp' : 'JP 6/17/2024 14:53'
}
EPGGameBoardExistenceTests >> testBackgroundCorrectSize [
	
	self assert: morph extent equals: 2000 @ 1310.
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
	#'squeak_changestamp' : 'JP 6/17/2024 14:55'
}
EPGGameBoardExistenceTests >> testCalculateAreaExtend [
	
	self assert: (morph planningArea extent) equals: (0.25 * 2000)@1310.
	self assert: (morph backlogArea extent) equals: (0.5 * 2000)@1310.
	self assert: (morph reviewArea extent) equals: (0.25 * 2000)@1310.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JP 6/17/2024 14:56'
}
EPGGameBoardExistenceTests >> testCalculateAreaPosition [
	
	self assert: (morph planningArea position) equals: 0@0.
	self assert: (morph backlogArea position) equals: (2000*0.25)@0.
	self assert: (morph reviewArea position) equals: (2000*0.75)@0.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 11:22'
}
EPGGameBoardExistenceTests >> testSectionMorphsExistence [
	
	self assert: morph planningArea isMorph equals: true;
		assert: morph backlogArea isMorph equals: true;
		assert: morph reviewArea isMorph equals: true.
]
