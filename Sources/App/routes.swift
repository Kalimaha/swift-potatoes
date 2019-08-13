import Vapor

public func routes(_ router: Router) throws {
  let potatoController = PotatoController()
  router.get("potatoes", use: potatoController.index)
  router.post("potatoes", use: potatoController.create)
  router.delete("potatoes", Potato.parameter, use: potatoController.delete)
}
