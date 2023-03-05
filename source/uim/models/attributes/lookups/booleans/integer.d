/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.attributes.lookups.booleans.integer;

@safe:
import uim.oop;

class DBooleanIntegerAttribute : DLookupAttribute {
  mixin(AttributeThis!("BooleanIntegerAttribute"));

  mixin(OProperty!("int[bool]", "lookups"));

  override DValue createValue() {
    return LookupValue!(bool, int)(this).isNullable(isNullable);
  }
}
mixin(AttributeCalls!("BooleanIntegerAttribute"));

version(test_uim_oops) { unittest {  
    // TODO tests
  }
}