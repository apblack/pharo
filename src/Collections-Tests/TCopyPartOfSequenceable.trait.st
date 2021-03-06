"
A trait for test purposes
"
Trait {
	#name : #TCopyPartOfSequenceable,
	#category : #'Collections-Tests-Abstract'
}

{ #category : #requirements }
TCopyPartOfSequenceable >> collectionWithoutEqualElements [

" return a collection not including equal elements "
	self explicitRequirement
]

{ #category : #requirements }
TCopyPartOfSequenceable >> empty [
	self explicitRequirement
]

{ #category : #requirements }
TCopyPartOfSequenceable >> indexInForCollectionWithoutDuplicates [
" return an index between 'collectionWithoutEqualsElements'  bounds"
	self explicitRequirement
]

{ #category : #'tests - fixture' }
TCopyPartOfSequenceable >> test0FixtureCopyPartOfSequenceableTest [
	self collectionWithoutEqualElements.
	self collectionWithoutEqualElements
		do: [ :each | self assert: (self collectionWithoutEqualElements occurrencesOf: each) = 1 ].
	self indexInForCollectionWithoutDuplicates.
	self
		assert:
			(self indexInForCollectionWithoutDuplicates > 0 & self indexInForCollectionWithoutDuplicates)
				< self collectionWithoutEqualElements size.
	self empty.
	self assert: self empty isEmpty
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyAfter [
	| result index collection |
	collection := self collectionWithoutEqualElements .
	index:= self indexInForCollectionWithoutDuplicates .
	result := collection   copyAfter: (collection  at:index ).
	
	"verifying content: "
	(1) to: result size do: 
		[:i |
		self assert: (collection   at:(i + index ))=(result at: (i))].

	"verify size: "
	self assert: result size = (collection   size - index).
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyAfterEmpty [
	| result |
	result := self empty copyAfter: self collectionWithoutEqualElements first.
	self assert: result isEmpty.
	
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyAfterLast [
	| result index collection |
	collection := self collectionWithoutEqualElements .
	index:= self indexInForCollectionWithoutDuplicates .
	result := collection   copyAfterLast: (collection  at:index ).
	
	"verifying content: "
	(1) to: result size do: 
		[:i |
		self assert: (collection   at:(i + index ))=(result at: (i))].

	"verify size: "
	self assert: result size = (collection   size - index).
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyAfterLastEmpty [
	| result |
	result := self empty copyAfterLast: self collectionWithoutEqualElements first.
	self assert: result isEmpty.
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyEmptyMethod [
	| result |
	result := self collectionWithoutEqualElements  copyEmpty .
	self assert: result isEmpty .
	self assert: result class= self nonEmpty class.
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyFromTo [
	| result  index collection |
	collection := self collectionWithoutEqualElements .
	index :=self indexInForCollectionWithoutDuplicates .
	result := collection   copyFrom: index  to: collection  size .
	
	"verify content of 'result' : "
	1 to: result size do:
		[:i | 
		self assert: (result at:i)=(collection  at: (i + index - 1))].
	
	"verify size of 'result' : "
	self assert: result size = (collection  size - index + 1).
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyUpTo [
	| result index collection |
	collection := self collectionWithoutEqualElements .
	index:= self indexInForCollectionWithoutDuplicates .
	result := collection   copyUpTo: (collection  at:index).
	
	"verify content of 'result' :"
	1 to: result size do: [:i| self assert: (collection   at:i)=(result at:i)].
	
	"verify size of 'result' :"
	self assert: result size = (index-1).
	
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyUpToEmpty [
	| result |
	result := self empty copyUpTo: self collectionWithoutEqualElements first.
	self assert: result isEmpty.
	
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyUpToLast [
	| result index collection |
	collection := self collectionWithoutEqualElements .
	index:= self indexInForCollectionWithoutDuplicates .
	result := collection   copyUpToLast: (collection  at:index).
	
	"verify content of 'result' :"
	1 to: result size do: [:i| self assert: (collection   at:i)=(result at:i)].
	
	"verify size of 'result' :"
	self assert: result size = (index-1).
]

{ #category : #'tests - copying part of sequenceable' }
TCopyPartOfSequenceable >> testCopyUpToLastEmpty [
	| result |
	result := self empty copyUpToLast: self collectionWithoutEqualElements first.
	self assert: result isEmpty.
]
