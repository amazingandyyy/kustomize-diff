package main

import (
	"fmt"
	"strings"

	githubactions "github.com/sethvargo/go-githubactions"
)

func main() {
	actions := githubactions.New()

	files := actions.GetInput("files")
	fmt.Println(strings.Split(files, "\n"))
}
