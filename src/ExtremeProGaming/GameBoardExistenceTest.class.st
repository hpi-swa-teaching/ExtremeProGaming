Class {
	#name : #GameBoardExistenceTest,
	#superclass : #MorphTest,
	#category : #ExtremeProGaming
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'JA 5/16/2024 10:14'
}
GameBoardExistenceTest >> setUp [

	morph := GameBoard new.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:53'
}
GameBoardExistenceTest >> testBackgroundCorrectColor [
	
	self assert: morph color equals: Color gray.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:49'
}
GameBoardExistenceTest >> testBackgroundCorrectPosition [
	
	self assert: morph position equals: 0 @ 0.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:45'
}
GameBoardExistenceTest >> testBackgroundCorrectSize [
	
	self assert: morph extent equals: 1920 @ 1080.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:33'
}
GameBoardExistenceTest >> testBackgroundMorphExistence [
	
	self assert: morph isMorph equals: true.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 10:36'
}
GameBoardExistenceTest >> testBackgroundMorphOpened [
	
	self shouldnt: morph openInWorld raise: Error.
]

{
	#category : #'tests - initialization',
	#'squeak_changestamp' : 'JA 5/16/2024 11:22'
}
GameBoardExistenceTest >> testSectionMorphsExistence [
	
	self assert: morph planningArea isMorph equals: true;
		assert: morph backlogArea isMorph equals: true;
		assert: morph reviewArea isMorph equals: true.
]
