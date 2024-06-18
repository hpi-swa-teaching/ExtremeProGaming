Class {
	#name : #EPGPermanentAddition,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 6/18/2024 23:32'
}
EPGPermanentAddition >> apply [

	self game addPermanent: self amount.
]
