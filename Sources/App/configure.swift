import FluentSQLite
import Vapor

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
  try services.register(FluentSQLiteProvider())

  let router = EngineRouter.default()
  try routes(router)
  services.register(router, as: Router.self)

  var middlewares = MiddlewareConfig() // Create _empty_ middleware config
  middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
  services.register(middlewares)

  let sqlite = try SQLiteDatabase(storage: .memory)

  var databases = DatabasesConfig()
  databases.add(database: sqlite, as: .sqlite)
  services.register(databases)

  var migrations = MigrationConfig()
  migrations.add(model: Potato.self, database: .sqlite)
  services.register(migrations)
}
