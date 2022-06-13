Class {
	#name : #BaselineOfGoHashMap,
	#superclass : #BaselineOf,
	#category : #BaselineOfGoHashMap
}

{ #category : #baselines }
BaselineOfGoHashMap >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'GoHashMap' ]
]
