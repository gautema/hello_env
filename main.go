package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	env := os.Getenv("ENVIRONMENT")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello %s", env)
	})

	http.ListenAndServe(":8080", nil)
}
