/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.attributes.lookups.integers.boolean;

@safe:
import uim.models;

class DIntegerBooleanAttribute : DLookupAttribute {
  mixin(AttributeThis!("IntegerBooleanAttribute"));

  mixin(OProperty!("bool[int]", "lookups"));  
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
  bool hasLookupValue(bool lookupValue) {
    foreach(k, v; _lookups) { if (v == lookupValue) return true; }
    return false; 
  }  

  override DValue createValue() {
    return LookupValue!(int, bool)(this).isNullable(isNullable); }  
}
mixin(AttributeCalls!("IntegerBooleanAttribute"));

version(test_uim_oops) { unittest {  
    // TODO tests
  }
}