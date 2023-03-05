/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.values.arrays.tag;

@safe:
import uim.oop;

class DTagArrayValue : DStringArrayValue {
  mixin(ValueThis!("TagArrayValue", "string[]"));  

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
  }

  override void set(string newValue) {
    debug writeln("In DTagArrayValue - ", newValue);
    this.value(newValue.split("#").map!(a => a.strip).array);
    debug writeln("After split - ", this.value);
  }

  size_t length() {
    return _values.length;
  }

  alias opEquals = DValue.opEquals;

  override DValue copy() {
    return TagArrayValue();
  }

  override string toString() {
    if (length > 0) return "#"~this.value.join(" #");
    return null; 
  }
}
mixin(ValueCalls!("TagArrayValue"));  

version(test_uim_oops) { unittest {
    auto attribute = TagArrayValue(["a", "b", "c"]);
    assert(attribute.value.length == 3);
    assert(attribute.value[0] == "a");
    assert(attribute.value[1] == "b");
}}