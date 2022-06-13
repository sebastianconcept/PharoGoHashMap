Class {
	#name : #GoHashMapTest,
	#superclass : #TestCase,
	#category : #'GoHashMap-Tests'
}

{ #category : #tests }
GoHashMapTest >> dummyValue [

	^ '{"ProtocolType":2,"RequestType":"Create Session Request"}'
]

{ #category : #tests }
GoHashMapTest >> setUp [

	GoHashMap reset
]

{ #category : #tests }
GoHashMapTest >> tearDown [

	GoHashMap reset
]

{ #category : #tests }
GoHashMapTest >> testIncludes [

	| key object |
	self assert: GoHashMap size equals: 0.
	1 to: 10 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		GoHashMap set: object key with: object value.
		self assert: (GoHashMap includes: key) ].
	self assert: GoHashMap size equals: 10
]

{ #category : #tests }
GoHashMapTest >> testManyOfSetGet [

	| key object |
	self assert: GoHashMap size equals: 0.
	1 to: 1000 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		GoHashMap set: object key with: object value.
		self
			assert: (GoHashMap get: key)
			equals: self dummyValue , i asString ].
	self assert: GoHashMap size equals: 1000
]

{ #category : #tests }
GoHashMapTest >> testRemove [

	| keys object firstKey lastKey|
	self assert: GoHashMap size equals: 0.
	keys := OrderedCollection new.
	1 to: 10 do: [ :i | 
		keys add: UUID new asString36.
		object := keys last -> (self dummyValue , i asString).
		GoHashMap set: object key with: object value.
		self
			assert: (GoHashMap get: keys last)
			equals: self dummyValue , i asString ].
	firstKey := keys first.
	lastKey := keys last.
	GoHashMap remove: firstKey.
	GoHashMap remove: lastKey.
	self assert: GoHashMap size equals: 8.
	self deny: (GoHashMap includes: firstKey).
	self deny: (GoHashMap includes: lastKey).
	self assert: (GoHashMap includes: keys allButFirst allButLast anyOne).
	
]

{ #category : #tests }
GoHashMapTest >> testReset [

	| key object |
	key := UUID new asString36.
	object := key -> self dummyValue.
	self assert: GoHashMap size equals: 0.
	GoHashMap set: object key with: object value.
	self assert: GoHashMap size equals: 1.
	self assert: (GoHashMap get: key) equals: self dummyValue.
	GoHashMap reset.
	self assert: GoHashMap size equals: 0.
	self assert: (GoHashMap get: key) equals: nil
]

{ #category : #tests }
GoHashMapTest >> testSetGet [

	| key object |
	key := UUID new asString36.
	object := key -> self dummyValue.
	self assert: GoHashMap size equals: 0.
	GoHashMap set: object key with: object value.
	self assert: GoHashMap size equals: 1.
	self assert: (GoHashMap get: key) equals: self dummyValue.
]

{ #category : #tests }
GoHashMapTest >> testSize [

	| key object |
	self assert: GoHashMap size equals: 0.
	1 to: 17 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		GoHashMap set: object key with: object value.
		self
			assert: (GoHashMap get: key)
			equals: self dummyValue , i asString ].
	self assert: GoHashMap size equals: 17.
	1 to: 3 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		GoHashMap set: object key with: object value.
		self
			assert: (GoHashMap get: key)
			equals: self dummyValue , i asString ].
	self assert: GoHashMap size equals: 20.	
	


]
