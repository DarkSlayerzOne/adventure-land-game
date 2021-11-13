package main

import (
	"adventure-land-game/enemies/app/controller"
	"adventure-land-game/enemies/app/data"
	router "adventure-land-game/enemies/app/http"
	"adventure-land-game/enemies/app/service"
	"fmt"
	"net/http"
)

var (
	_enemyData      data.EnemyRepoInterface             = data.EnemyRepoImpl()
	_enemyService   service.EnemyServiceInterface       = service.EnemyServiceImpl(_enemyData)
	enemyController controller.EnemyControllerInterface = controller.EnemyControllerImpl(_enemyService)

	httpRouter router.Router = router.MuxRouterImpl()
)

func main() {

	const port string = ":8081"
	const baseUrl string = "/adv/v1/enemy"

	httpRouter.GET("/check", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Up and running...")
	})

	httpRouter.POST(baseUrl, enemyController.CreateEnemy)

	httpRouter.GET(baseUrl, enemyController.ReadEnemyDetails)

	httpRouter.GET(baseUrl+"/{enemyID}", enemyController.ReadEnemy)

	httpRouter.SERVE(port)

}
