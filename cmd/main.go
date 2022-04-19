package main

import (
	"fmt"

	"github.com/sethvargo/go-githubactions"
)

func main() {
	actions := githubactions.WithFieldsMap(map[string]string{
		"file": "myfile.js",
		"line": "100",
	})

	val := actions.GetInput("val")
	if val == "" {
		actions.Fatalf("missing 'val'")
	}

	fmt.Println("Hello")
}
