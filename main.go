package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello from Cloud Run!")
    })

    // Listen on port 8080
    if err := http.ListenAndServe(":8080", nil); err != nil {
        panic(err)
    }
}
