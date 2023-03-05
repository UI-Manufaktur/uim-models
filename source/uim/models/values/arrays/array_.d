/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.values.arrays.array_;

@safe:
import uim.models;

class DArrayValue : DValue {
  mixin(ValueThis!("ArrayValue"));  
  this(DValue[] values) {
    this();
    _items = values.dup;
  }

  DValue[] _items;

  // Initialization hook method.
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .isArray(true);
  }

  DArrayValue add(DValue[] values...) { 
    add(values); 
    return this; }

  DArrayValue add(DValue[] values) {
    _items ~= values.dup; 
    return this;
  }
  /// 
  unittest {
    writeln(ArrayValue.add(StringValue("1x"), StringValue("2x")).values.map!(v => v.toString).array);
  }
  
  alias opEquals = DValue.opEquals;

  DValue[] values() { return _items; }

  override DValue copy() {
    auto arrayValue = ArrayValue;
    foreach(item; _items) { arrayValue.add(item); }
    return arrayValue;
  }

  override string toString() {
    return "["~_items.map!(item => item.toString).join(",")~"]";
  }
}
mixin(ValueCalls!("ArrayValue")); 
auto ArrayValue(DValue[] values) { return new DArrayValue(values); } 

///
unittest {
  auto value = new DArrayValue;
  assert(value.isArray);
}