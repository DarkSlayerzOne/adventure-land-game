package main

import (
	c "adventure-land-game/items/app/controllers"
	d "adventure-land-game/items/app/data"
	router "adventure-land-game/items/app/http"
	s "adventure-land-game/items/app/service"
	"fmt"
	"net/http"
)

var (
	_itemRepo       d.ItemRepoInterface       = d.ItemRepoInterfaceImpl()
	_itemService    s.ItemServiceInterface    = s.ItemServiceInterfaceImple(_itemRepo)
	_itemController c.ItemControllerInterface = c.ItemControllerInterfaceImple(_itemService)

	httpRouter router.Router = router.MuxRouterImpl()
)

func main() {

	const port string = ":8082"
	const baseUrl string = "/adv/v1/item"

	httpRouter.GET("/check", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Up and running...")
	})

	httpRouter.GET(baseUrl+"/{itemType}", _itemController.GetItemsList)

	httpRouter.SERVE(port)
}
