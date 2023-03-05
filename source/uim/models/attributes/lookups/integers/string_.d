/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.lookups.integers.string_;

@safe:
import uim.models;

class DIntegerStringAttribute : DLookupAttribute {
  mixin(AttributeThis!("IntegerStringAttribute"));

  mixin(OProperty!("string[int]", "lookups"));  
  O addLookup(this O)(int key, string value) {
    _lookups[key] = value;
    return cast(O)this;
  }

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    // means.measurement.lookup

    this
      .name("lookup")
      .dataFormats(["lookup", "integer", "string"])
      .registerPath("lookup");
  }

  bool hasLookupKey(int key) {
    return (key in _lookups ? true : false); 
  }
  bool hasLookupValue(string lookupValue) {
    foreach(k, v; _lookups) { if (v == lookupValue) return true; }
    return false; 
  }  

  override DValue createValue() {
    return LookupValue!(int, string)(this).isNullable(isNullable); }  
}
mixin(AttributeCalls!("IntegerStringAttribute"));

version(test_uim_oops) { unittest {  
    // TODO tests
  }
}