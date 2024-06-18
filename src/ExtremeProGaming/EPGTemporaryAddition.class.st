Class {
	#name : #EPGTemporaryAddition,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 6/18/2024 23:06'
}
EPGTemporaryAddition >> apply [

	self game addTemporary: self amount.
]
