import Vapor

final class PotatoController {
  func index(_ req: Request) throws -> Future<[Potato]> {
    return Potato.query(on: req).all()
  }

  func create(_ req: Request) throws -> Future<Potato> {
    return try req.content.decode(Potato.self).flatMap { potato in
      return potato.save(on: req)
    }
  }

  func delete(_ req: Request) throws -> Future<HTTPStatus> {
    return try req.parameters.next(Potato.self).flatMap { potato in
      return potato.delete(on: req)
    }.transform(to: .ok)
  }
}
