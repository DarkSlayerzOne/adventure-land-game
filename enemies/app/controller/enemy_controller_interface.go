package controller

import (
	"net/http"
)

type EnemyControllerInterface interface {
	CreateEnemy(r http.ResponseWriter, request *http.Request)
	ReadEnemyDetails(r http.ResponseWriter, request *http.Request)
	ReadEnemy(r http.ResponseWriter, request *http.Request)
}
