module uim.models.classes.model;

import uim.models;
@safe:

class DModel : IModel { 
  mixin(ModelThis!("Model"));

  void initialize(Json configSettings = Json(null)) {}

  mixin(OProperty!("string", "name"));

  /**
    * Default config
    * These are merged with user-provided config when the component is used.
    */
  mixin(OProperty!("Json", "defaultConfig"));

  // Configuration of mvcobject
  mixin(OProperty!("Json", "config"));

  DModel create() {
    return Model;
  }
  DModel copy() {
    auto result = create;
    return result.fromJson(this.toJson);
  }  
}
mixin(ModelCalls!("Model", "DModel"));

version(test_uim_models) { unittest { 
  assert(Model);
  assert(Model.name == "Model");
}} 