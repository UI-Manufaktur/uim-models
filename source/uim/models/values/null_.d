/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.values.null_;

@safe:
import uim.models;

class DNullValue : DValue {
  mixin(ValueThis!("NullValue"));  

  // Initialization hook method.
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .isNull(true);
  }

  override DValue copy() {
    return NullValue;
  }

  override Json toJson() { return Json(null); }
  override string toString() { return null; }
}
mixin(ValueCalls!("NullValue"));  
