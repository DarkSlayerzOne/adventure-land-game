package controller

import (
	d "adventure-land-game/enemies/app/dto"
	res "adventure-land-game/enemies/app/response"
	sv "adventure-land-game/enemies/app/service"
	v "adventure-land-game/enemies/app/validations"
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

type enemyController struct{}

var (
	_enemyService sv.EnemyServiceInterface
)

const (
	POST   string = "POST"
	GET    string = "GET"
	PUT    string = "PUT"
	DELETE string = "DELETE"
)

func EnemyControllerImpl(es sv.EnemyServiceInterface) EnemyControllerInterface {
	_enemyService = es
	return &enemyController{}
}

func (*enemyController) CreateEnemy(r http.ResponseWriter, request *http.Request) {
	r.Header().Set("Content-Type", "application/json")

	var enemy d.EnemyDto

	err := json.NewDecoder(request.Body).Decode(&enemy)

	if err != nil {
		r.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(r).Encode(res.ErrorResponse{Message: "Error unmarshalling data"})
	}

	val, ut := v.EnemyDTOValidation()
	errs := val.Struct(enemy)
	if errs != nil {
		r.WriteHeader(http.StatusBadRequest)
		json.NewEncoder(r).Encode(ut)
	}

	id, err := _enemyService.CreateEnemy(enemy)

	if err != nil {
		r.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(r).Encode(err)
	}

	r.WriteHeader(http.StatusOK)
	json.NewEncoder(r).Encode(res.CreateEnemyResponse{EnemyID: id})
}

func (*enemyController) ReadEnemyDetails(r http.ResponseWriter, request *http.Request) {
	r.Header().Set("Content-Type", "application/json")
	searchIndex := request.FormValue("q")
	pageSize, _ := strconv.Atoi(request.FormValue("pageSize"))
	pageIndex, _ := strconv.Atoi(request.FormValue("pageIndex"))

	enemies, err := _enemyService.ReadEnemyDetails(pageSize, pageIndex, searchIndex)

	if err != nil {
		r.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(r).Encode(res.ErrorResponse{StatusCode: 500, Message: err.Error()})
		return
	}

	r.WriteHeader(http.StatusOK)
	json.NewEncoder(r).Encode(enemies)

}

func (*enemyController) ReadEnemy(r http.ResponseWriter, request *http.Request) {
	r.Header().Set("Content-Type", "application/json")
	id := mux.Vars(request)["enemyID"]

	enemy, err := _enemyService.ReadEnemyDetail(id)

	if err != nil {
		r.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(r).Encode(res.ErrorResponse{StatusCode: 500, Message: err.Error()})
		return
	}

	if enemy.ID == "" {
		r.WriteHeader(http.StatusNotFound)
		json.NewEncoder(r).Encode(res.ErrorResponse{StatusCode: 404, Message: "404 Not found"})
		return
	}

	r.WriteHeader(http.StatusOK)
	json.NewEncoder(r).Encode(enemy)
}
