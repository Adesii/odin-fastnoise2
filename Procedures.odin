package FastNoise
import fn "raw"

Node :: rawptr

NewFromEncodedNodeTree :: proc(
	encodedString: cstring,
	maxFeatureSet: Feature_Set = Feature_Set{.MAX},
) -> Node {
	if .MAX in maxFeatureSet {
		max: u32 = 0
		return fn.NewFromEncodedNodeTree(encodedString, transmute(u32)~max)
	}
	return fn.NewFromEncodedNodeTree(encodedString, transmute(u32)maxFeatureSet)
}

DeleteNodeRef :: proc(node: Node) {
	fn.DeleteNodeRef(node)
}

GetActiveFeatureSet :: proc(node: Node) -> u32 {
	return fn.GetActiveFeatureSet(node)
}

GetMetadataID :: proc(node: Node) -> i32 {
	return fn.GetMetadataID(node)
}

GenUniformGrid :: proc {
	GenUniformGrid2D,
	GenUniformGrid3D,
	GenUniformGrid4D,
}


GenUniformGrid2D :: proc(
	node: Node,
	noiseOut: []f32,
	offset: [2]f32,
	count: [2]i32,
	stepSize: [2]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenUniformGrid2D(
		node,
		raw_data(noiseOut),
		offset.x,
		offset.y,
		count.x,
		count.y,
		stepSize.x,
		stepSize.y,
		seed,
		cast(^f32)outputMinMax,
	)
}

GenUniformGrid3D :: proc(
	node: Node,
	noiseOut: []f32,
	offset: [3]f32,
	count: [3]i32,
	stepSize: [3]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenUniformGrid3D(
		node,
		raw_data(noiseOut),
		offset.x,
		offset.y,
		offset.z,
		count.x,
		count.y,
		count.z,
		stepSize.x,
		stepSize.y,
		stepSize.z,
		seed,
		cast(^f32)outputMinMax,
	)
}

GenUniformGrid4D :: proc(
	node: Node,
	noiseOut: []f32,
	offset: [4]f32,
	count: [4]i32,
	stepSize: [4]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenUniformGrid4D(
		node,
		raw_data(noiseOut),
		offset.x,
		offset.y,
		offset.z,
		offset.w,
		count.x,
		count.y,
		count.z,
		count.w,
		stepSize.x,
		stepSize.y,
		stepSize.z,
		stepSize.w,
		seed,
		cast(^f32)outputMinMax,
	)
}


GenPositionArray :: proc {
	GenPositionArray2D,
	GenPositionArray3D,
	GenPositionArray4D,
}
GenPositionArray2D :: proc(
	node: Node,
	noiseOut: []f32,
	count: i32,
	xPosArray: []f32,
	yPosArray: []f32,
	offset: [2]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenPositionArray2D(
		node,
		raw_data(noiseOut),
		count,
		raw_data(xPosArray),
		raw_data(yPosArray),
		offset.x,
		offset.y,
		seed,
		cast(^f32)outputMinMax,
	)
}

GenPositionArray3D :: proc(
	node: Node,
	noiseOut: []f32,
	count: i32,
	xPosArray: []f32,
	yPosArray: []f32,
	zPosArray: []f32,
	offset: [3]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenPositionArray3D(
		node,
		raw_data(noiseOut),
		count,
		raw_data(xPosArray),
		raw_data(yPosArray),
		raw_data(zPosArray),
		offset.x,
		offset.y,
		offset.z,
		seed,
		cast(^f32)outputMinMax,
	)
}

GenPositionArray4D :: proc(
	node: Node,
	noiseOut: []f32,
	count: i32,
	xPosArray: []f32,
	yPosArray: []f32,
	zPosArray: []f32,
	wPosArray: []f32,
	offset: [4]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenPositionArray4D(
		node,
		raw_data(noiseOut),
		count,
		raw_data(xPosArray),
		raw_data(yPosArray),
		raw_data(zPosArray),
		raw_data(wPosArray),
		offset.x,
		offset.y,
		offset.z,
		offset.w,
		seed,
		cast(^f32)outputMinMax,
	)
}

GenTileable2D :: proc(
	node: Node,
	noiseOut: []f32,
	size: [2]i32,
	stepSize: [2]f32,
	seed: i32,
	outputMinMax: ^[2]f32 = nil,
) {
	fn.GenTileable2D(
		node,
		raw_data(noiseOut),
		size.x,
		size.y,
		stepSize.x,
		stepSize.y,
		seed,
		cast(^f32)outputMinMax,
	)
}

GenSingle :: proc {
	GenSingle2D,
	GenSingle3D,
	GenSingle4D,
}

GenSingle2D :: proc(node: Node, pos: [2]f32, seed: i32) -> f32 {
	return fn.GenSingle2D(node, pos.x, pos.y, seed)
}

GenSingle3D :: proc(node: Node, pos: [3]f32, seed: i32) -> f32 {
	return fn.GenSingle3D(node, pos.x, pos.y, pos.z, seed)
}

GenSingle4D :: proc(node: Node, pos: [4]f32, seed: i32) -> f32 {
	return fn.GenSingle4D(node, pos.x, pos.y, pos.z, pos.w, seed)
}

GetMetadataCount :: proc() -> i32 {
	return fn.GetMetadataCount()
}

GetMetadataName :: proc(id: i32) -> cstring {
	return fn.GetMetadataName(id)
}

NewFromMetadata :: proc(id: i32, maxFeatureSet: Feature_Set) -> Node {
	return fn.NewFromMetadata(id, transmute(u32)maxFeatureSet)
}

GetMetadataVariableCount :: proc(id: i32) -> i32 {
	return fn.GetMetadataVariableCount(id)
}

GetMetadataVariableName :: proc(id: i32, variableIndex: i32) -> cstring {
	return fn.GetMetadataVariableName(id, variableIndex)
}

GetMetadataVariableType :: proc(id: i32, variableIndex: i32) -> i32 {
	return fn.GetMetadataVariableType(id, variableIndex)
}

GetMetadataVariableDimensionIdx :: proc(id: i32, variableIndex: i32) -> i32 {
	return fn.GetMetadataVariableDimensionIdx(id, variableIndex)
}

GetMetadataEnumCount :: proc(id: i32, variableIndex: i32) -> i32 {
	return fn.GetMetadataEnumCount(id, variableIndex)
}

GetMetadataEnumName :: proc(id: i32, variableIndex: i32, enumIndex: i32) -> cstring {
	return fn.GetMetadataEnumName(id, variableIndex, enumIndex)
}

SetVariableFloat :: proc(node: Node, variableIndex: i32, value: f32) -> b8 {
	return fn.SetVariableFloat(node, variableIndex, value)
}

SetVariableIntEnum :: proc(node: Node, variableIndex: i32, value: i32) -> b8 {
	return fn.SetVariableIntEnum(node, variableIndex, value)
}

GetMetadataNodeLookupCount :: proc(id: i32) -> i32 {
	return fn.GetMetadataNodeLookupCount(id)
}

GetMetadataNodeLookupName :: proc(id: i32, nodeLookupIndex: i32) -> cstring {
	return fn.GetMetadataNodeLookupName(id, nodeLookupIndex)
}

GetMetadataNodeLookupDimensionIdx :: proc(id: i32, nodeLookupIndex: i32) -> i32 {
	return fn.GetMetadataNodeLookupDimensionIdx(id, nodeLookupIndex)
}

SetNodeLookup :: proc(node: Node, nodeLookupIndex: i32, nodeLookup: Node) -> b8 {
	return fn.SetNodeLookup(node, nodeLookupIndex, nodeLookup)
}

GetMetadataHybridCount :: proc(id: i32) -> i32 {
	return fn.GetMetadataHybridCount(id)
}

GetMetadataHybridName :: proc(id: i32, hybridIndex: i32) -> cstring {
	return fn.GetMetadataHybridName(id, hybridIndex)
}

GetMetadataHybridDimensionIdx :: proc(id: i32, hybridIndex: i32) -> i32 {
	return fn.GetMetadataHybridDimensionIdx(id, hybridIndex)
}

SetHybridNodeLookup :: proc(node: Node, hybridIndex: i32, nodeLookup: Node) -> b8 {
	return fn.SetHybridNodeLookup(node, hybridIndex, nodeLookup)
}

SetHybridFloat :: proc(node: Node, hybridIndex: i32, value: f32) -> b8 {
	return fn.SetHybridFloat(node, hybridIndex, value)
}

GetMetadataDescription :: proc(id: i32) -> cstring {
	return fn.GetMetadataDescription(id)
}

GetMetadataGroupCount :: proc(id: i32) -> i32 {
	return fn.GetMetadataGroupCount(id)
}

GetMetadataGroupName :: proc(id: i32, groupIndex: i32) -> cstring {
	return fn.GetMetadataGroupName(id, groupIndex)
}

GetMetadataVariableDescription :: proc(id: i32, variableIndex: i32) -> cstring {
	return fn.GetMetadataVariableDescription(id, variableIndex)
}

GetMetadataVariableDefaultFloat :: proc(id: i32, variableIndex: i32) -> f32 {
	return fn.GetMetadataVariableDefaultFloat(id, variableIndex)
}

GetMetadataVariableDefaultIntEnum :: proc(id: i32, variableIndex: i32) -> i32 {
	return fn.GetMetadataVariableDefaultIntEnum(id, variableIndex)
}

GetMetadataVariableMinFloat :: proc(id: i32, variableIndex: i32) -> f32 {
	return fn.GetMetadataVariableMinFloat(id, variableIndex)
}

GetMetadataVariableMaxFloat :: proc(id: i32, variableIndex: i32) -> f32 {
	return fn.GetMetadataVariableMaxFloat(id, variableIndex)
}

GetMetadataNodeLookupDescription :: proc(id: i32, nodeLookupIndex: i32) -> cstring {
	return fn.GetMetadataNodeLookupDescription(id, nodeLookupIndex)
}

GetMetadataHybridDescription :: proc(id: i32, hybridIndex: i32) -> cstring {
	return fn.GetMetadataHybridDescription(id, hybridIndex)
}

GetMetadataHybridDefault :: proc(id: i32, hybridIndex: i32) -> f32 {
	return fn.GetMetadataHybridDefault(id, hybridIndex)
}
