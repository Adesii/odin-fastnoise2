package main
import fn ".."
import "core:fmt"

main :: proc() {
	//Create a nodetree from a encoded string
	node := fn.NewFromEncodedNodeTree("DQkdCRAJBgwDzcxMPwtmZpZABAMK1yM+Cw@AEAE")
	defer fn.DeleteNodeRef(node)

	fmt.printfln("node pointer: %v", node)

	example_array := make([]f32, 64 * 64, context.allocator)
	fn.GenTileable2D(node, example_array, {64, 64}, {32, 32}, 1337)

	// You can also use the min max as a optional parameter like this:
	// outputminmax := [2]f32{0.0, 1.0}
	// fn.GenTileable2D(node, example_array, {64, 64}, {32, 32}, 1337, &outputminmax)


	//Print the generated array as a grid of 1s and 0s in the terminal
	for x in 0 ..< 64 {
		for y in 0 ..< 64 {
			value := example_array[x + y * 64]
			if value > 1.5 {
				fmt.printf("1")
			} else {
				fmt.printf("0")
			}
		}
		fmt.printfln("")
	}

	// Generate a single value from the nodetree
	value := fn.GenSingle(node, [2]f32{64.0, 64.0}, 0)
	fmt.printfln("single value: %f", value)
}
