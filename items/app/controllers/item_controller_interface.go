package controllers

import (
	"net/http"
)

type ItemControllerInterface interface {
	GetItemsList(r http.ResponseWriter, request *http.Request)
}
