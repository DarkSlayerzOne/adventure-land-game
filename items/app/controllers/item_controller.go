package controllers

import (
	res "adventure-land-game/items/app/response"
	s "adventure-land-game/items/app/service"
	"net/http"
	"strconv"

	"encoding/json"

	"github.com/gorilla/mux"
)

type itemController struct{}

var _itemService s.ItemServiceInterface

const (
	GET string = "GET"
	PUT string = "PUT"
)

func ItemControllerInterfaceImple(is s.ItemServiceInterface) ItemControllerInterface {
	_itemService = is
	return &itemController{}
}

func (*itemController) GetItemsList(r http.ResponseWriter, request *http.Request) {
	r.Header().Set("Content-Type", "application/json")
	itemType := mux.Vars(request)["itemType"]

	if itemType == "" {
		r.WriteHeader(http.StatusBadRequest)
		json.NewEncoder(r).Encode(res.ErrorResponse{StatusCode: 400, Message: "Item type parameter is missing"})
		return
	}

	searchIndex := request.FormValue("q")
	pageSize, _ := strconv.Atoi(request.FormValue("pageSize"))
	pageIndex, _ := strconv.Atoi(request.FormValue("pageIndex"))

	enemies, err := _itemService.GetItemList(searchIndex, itemType, pageSize, pageIndex)

	if err != nil {
		r.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(r).Encode(res.ErrorResponse{StatusCode: 500, Message: err.Error()})
		return
	}

	r.WriteHeader(http.StatusOK)
	json.NewEncoder(r).Encode(enemies)

}
