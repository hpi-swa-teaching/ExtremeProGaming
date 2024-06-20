Class {
	#name : #EPGTemporaryAddition,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:56'
}
EPGTemporaryAddition >> apply [

	self game addTemporary: self amount.
]
