module uim.models.elements.registry;

@safe:
import uim.models;

class DElementRegistry : DRegistry!DElement {
  static DElementRegistry registry;
}
auto ElementRegistry() { // SIngleton
  if (DElementRegistry.registry is null) {
    DElementRegistry.registry = new DElementRegistry;
  }
  return DElementRegistry.registry;
}
