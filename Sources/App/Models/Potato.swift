import FluentSQLite
import Vapor

final class Potato: SQLiteModel {
  var id: Int?
  var variety: String

  init(id: Int? = nil, title: String) {
    self.id = id
    self.variety = title
  }
}

extension Potato: Migration { }
extension Potato: Content { }
extension Potato: Parameter { }
