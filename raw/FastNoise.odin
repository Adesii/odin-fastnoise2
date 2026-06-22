#+build linux amd64, windows amd64, darwin amd64
package raw

@(default_calling_convention = "c")
foreign raw_runic {
	@(link_name = "fnNewFromEncodedNodeTree")
	NewFromEncodedNodeTree :: proc(encodedString: cstring, maxFeatureSet: u32) -> rawptr ---

	@(link_name = "fnDeleteNodeRef")
	DeleteNodeRef :: proc(node: rawptr) ---

	@(link_name = "fnGetActiveFeatureSet")
	GetActiveFeatureSet :: proc(node: rawptr) -> u32 ---

	@(link_name = "fnGetMetadataID")
	GetMetadataID :: proc(node: rawptr) -> i32 ---

	@(link_name = "fnGenUniformGrid2D")
	GenUniformGrid2D :: proc(node: rawptr, noiseOut: ^f32, xOffset: f32, yOffset: f32, xCount: i32, yCount: i32, xStepSize: f32, yStepSize: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenUniformGrid3D")
	GenUniformGrid3D :: proc(node: rawptr, noiseOut: ^f32, xOffset: f32, yOffset: f32, zOffset: f32, xCount: i32, yCount: i32, zCount: i32, xStepSize: f32, yStepSize: f32, zStepSize: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenUniformGrid4D")
	GenUniformGrid4D :: proc(node: rawptr, noiseOut: ^f32, xOffset: f32, yOffset: f32, zOffset: f32, wOffset: f32, xCount: i32, yCount: i32, zCount: i32, wCount: i32, xStepSize: f32, yStepSize: f32, zStepSize: f32, wStepSize: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenPositionArray2D")
	GenPositionArray2D :: proc(node: rawptr, noiseOut: ^f32, count: i32, xPosArray: ^f32, yPosArray: ^f32, xOffset: f32, yOffset: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenPositionArray3D")
	GenPositionArray3D :: proc(node: rawptr, noiseOut: ^f32, count: i32, xPosArray: ^f32, yPosArray: ^f32, zPosArray: ^f32, xOffset: f32, yOffset: f32, zOffset: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenPositionArray4D")
	GenPositionArray4D :: proc(node: rawptr, noiseOut: ^f32, count: i32, xPosArray: ^f32, yPosArray: ^f32, zPosArray: ^f32, wPosArray: ^f32, xOffset: f32, yOffset: f32, zOffset: f32, wOffset: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenTileable2D")
	GenTileable2D :: proc(node: rawptr, noiseOut: ^f32, xSize: i32, ySize: i32, xStepSize: f32, yStepSize: f32, seed: i32, outputMinMax: ^f32) ---

	@(link_name = "fnGenSingle2D")
	GenSingle2D :: proc(node: rawptr, x: f32, y: f32, seed: i32) -> f32 ---

	@(link_name = "fnGenSingle3D")
	GenSingle3D :: proc(node: rawptr, x: f32, y: f32, z: f32, seed: i32) -> f32 ---

	@(link_name = "fnGenSingle4D")
	GenSingle4D :: proc(node: rawptr, x: f32, y: f32, z: f32, w: f32, seed: i32) -> f32 ---

	@(link_name = "fnGetMetadataCount")
	GetMetadataCount :: proc() -> i32 ---

	@(link_name = "fnGetMetadataName")
	GetMetadataName :: proc(id: i32) -> cstring ---

	@(link_name = "fnNewFromMetadata")
	NewFromMetadata :: proc(id: i32, maxFeatureSet: u32) -> rawptr ---

	@(link_name = "fnGetMetadataVariableCount")
	GetMetadataVariableCount :: proc(id: i32) -> i32 ---

	@(link_name = "fnGetMetadataVariableName")
	GetMetadataVariableName :: proc(id: i32, variableIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataVariableType")
	GetMetadataVariableType :: proc(id: i32, variableIndex: i32) -> i32 ---

	@(link_name = "fnGetMetadataVariableDimensionIdx")
	GetMetadataVariableDimensionIdx :: proc(id: i32, variableIndex: i32) -> i32 ---

	@(link_name = "fnGetMetadataEnumCount")
	GetMetadataEnumCount :: proc(id: i32, variableIndex: i32) -> i32 ---

	@(link_name = "fnGetMetadataEnumName")
	GetMetadataEnumName :: proc(id: i32, variableIndex: i32, enumIndex: i32) -> cstring ---

	@(link_name = "fnSetVariableFloat")
	SetVariableFloat :: proc(node: rawptr, variableIndex: i32, value: f32) -> b8 ---

	@(link_name = "fnSetVariableIntEnum")
	SetVariableIntEnum :: proc(node: rawptr, variableIndex: i32, value: i32) -> b8 ---

	@(link_name = "fnGetMetadataNodeLookupCount")
	GetMetadataNodeLookupCount :: proc(id: i32) -> i32 ---

	@(link_name = "fnGetMetadataNodeLookupName")
	GetMetadataNodeLookupName :: proc(id: i32, nodeLookupIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataNodeLookupDimensionIdx")
	GetMetadataNodeLookupDimensionIdx :: proc(id: i32, nodeLookupIndex: i32) -> i32 ---

	@(link_name = "fnSetNodeLookup")
	SetNodeLookup :: proc(node: rawptr, nodeLookupIndex: i32, nodeLookup: rawptr) -> b8 ---

	@(link_name = "fnGetMetadataHybridCount")
	GetMetadataHybridCount :: proc(id: i32) -> i32 ---

	@(link_name = "fnGetMetadataHybridName")
	GetMetadataHybridName :: proc(id: i32, hybridIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataHybridDimensionIdx")
	GetMetadataHybridDimensionIdx :: proc(id: i32, hybridIndex: i32) -> i32 ---

	@(link_name = "fnSetHybridNodeLookup")
	SetHybridNodeLookup :: proc(node: rawptr, hybridIndex: i32, nodeLookup: rawptr) -> b8 ---

	@(link_name = "fnSetHybridFloat")
	SetHybridFloat :: proc(node: rawptr, hybridIndex: i32, value: f32) -> b8 ---

	@(link_name = "fnGetMetadataDescription")
	GetMetadataDescription :: proc(id: i32) -> cstring ---

	@(link_name = "fnGetMetadataGroupCount")
	GetMetadataGroupCount :: proc(id: i32) -> i32 ---

	@(link_name = "fnGetMetadataGroupName")
	GetMetadataGroupName :: proc(id: i32, groupIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataVariableDescription")
	GetMetadataVariableDescription :: proc(id: i32, variableIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataVariableDefaultFloat")
	GetMetadataVariableDefaultFloat :: proc(id: i32, variableIndex: i32) -> f32 ---

	@(link_name = "fnGetMetadataVariableDefaultIntEnum")
	GetMetadataVariableDefaultIntEnum :: proc(id: i32, variableIndex: i32) -> i32 ---

	@(link_name = "fnGetMetadataVariableMinFloat")
	GetMetadataVariableMinFloat :: proc(id: i32, variableIndex: i32) -> f32 ---

	@(link_name = "fnGetMetadataVariableMaxFloat")
	GetMetadataVariableMaxFloat :: proc(id: i32, variableIndex: i32) -> f32 ---

	@(link_name = "fnGetMetadataNodeLookupDescription")
	GetMetadataNodeLookupDescription :: proc(id: i32, nodeLookupIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataHybridDescription")
	GetMetadataHybridDescription :: proc(id: i32, hybridIndex: i32) -> cstring ---

	@(link_name = "fnGetMetadataHybridDefault")
	GetMetadataHybridDefault :: proc(id: i32, hybridIndex: i32) -> f32 ---

}

when (ODIN_OS == .Windows) {

	foreign import raw_runic "../FastNoise2/build/lib/libFastNoise.lib"

} else {

	foreign import raw_runic "../FastNoise2/build/lib/libFastNoise.a"

}
