package router

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

type muxRouter struct{}

var (
	muxDispatcher = mux.NewRouter()
)

const (
	POST   string = "POST"
	GET    string = "GET"
	PUT    string = "PUT"
	DELETE string = "DELETE"
)

func MuxRouterImpl() Router {
	return &muxRouter{}
}

func (*muxRouter) GET(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	fmt.Println("invoke get request")
	muxDispatcher.HandleFunc(uri, f).Methods(GET)
}

func (*muxRouter) POST(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	fmt.Println("invoke post request")
	muxDispatcher.HandleFunc(uri, f).Methods(POST)
}

func (*muxRouter) PUT(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	fmt.Println("invoke put request")
	muxDispatcher.HandleFunc(uri, f).Methods(PUT)
}

func (*muxRouter) DELETE(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	fmt.Println("invoke delete request")
	muxDispatcher.HandleFunc(uri, f).Methods(DELETE)
}

func (*muxRouter) SERVE(port string) {
	fmt.Printf("Mux HTTP server running on port %v", port)
	http.ListenAndServe(port, muxDispatcher)
}
