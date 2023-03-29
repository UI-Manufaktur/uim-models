module uim.models.entities.registry;

@safe:
import uim.models;

class DEntityRegistry : DRegistry!DEntity {
  static DEntityRegistry registry;
}
auto EntityRegistry() { // SIngleton
  if (DEntityRegistry.registry is null) {
    DEntityRegistry.registry = new DEntityRegistry;
  }
  return DEntityRegistry.registry;
}
