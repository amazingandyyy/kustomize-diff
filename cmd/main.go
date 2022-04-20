package main

import (
	"fmt"

	githubactions "github.com/sethvargo/go-githubactions"
)

func main() {
	actions := githubactions.New()

	message := actions.GetInput("message")
	fmt.Println(message)
}
