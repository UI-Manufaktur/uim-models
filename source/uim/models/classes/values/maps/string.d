/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.classes.values.maps.string;

import uim.models;
@safe:

class DStringValueMap : DValue, IMap {
  mixin(ValueThis!("StringValueMap"));

  protected DValue[string] _items;

  DStringValueMap opIndexAssign(DValue value, string key) {
    if (containsKey(key)) {
      _items[key] = value; 
    } else {
      _items[key] = value; }

    return this;
  }

  DStringValueMap opIndexAssign(bool value, string key) {
    if (containsKey(key)) {
      _items[key].value(value ? "true" : "false"); 
    } else {
    _items[key] = new DBooleanValue(value); }

    return this;
  }

  DStringValueMap opIndexAssign(int value, string key) {
    if (containsKey(key)) {
      _items[key].value(to!string(value)); 
    } else {
    _items[key] = new DIntegerValue(value); }

    return this;
  }

  DStringValueMap opIndexAssign(double value, string key) {
    if (containsKey(key)) {
      _items[key].value(to!string(value)); 
    } else {
    _items[key] = new DDoubleValue(value); }
    
    return this;
  }

  DStringValueMap opIndexAssign(string value, string key) {    
     if (containsKey(key)) {
      _items[key].value(value); 
    } else {
     _items[key] = new DStringValue(value); }
    
    return this;
  }

  DStringValueMap opIndexAssign(UUID value, string key) {
    if (containsKey(key)) {
      _items[key].value(value.toString); 
    } else {
      _items[key] = new DUUIDValue(value); }

    return this;
  }

  DStringValueMap opIndexAssign(DValue[] values, string key) {
    if (containsKey(key)) {
      _items[key] = new DArrayValue(values); 
    } else {
      _items[key] = new DArrayValue(values); }

    return this;
  }

  DValue opIndex(this O)(string key) {
    return _items.get(key, null);
  }

  bool isEmpty() {
    return (_items.length == 0);    
  }

  size_t length() {
    return _items.length;    
  }

  string[] keys() {
    return _items.keys;
  }

  // containsKey - Returns true if this map contains a mapping for the specified key.
  bool containsKey(string key) {
    foreach(k; keys) {
      if (k == key) { return true; }
    }
    return false;
  }

  DValue[] values() {
    return _items.values;
  }

  /// containsValue - Returns true if this map maps one or more keys to the specified value.
  bool containsValue(DValue value) {
    foreach(v; values) {
      if (v == value) { return true; }
    }
    return false;
  }

  override DValue copy() {
    return NullValue; // StringValueMap(attribute, toJson);
  }
  override DValue dup() {
    return copy;
  }

  override Json toJson() {
    Json results = Json.emptyObject;

    foreach(key, value; _items) {
      results[key] = value.toJson;
    }

    return results;
  }

  override string toString() {
    string[] results;

    foreach(key, value; _items) {
      results ~= "%s:%s".format(key, value);
    }

    return "["~results.join(",") ~"]";
  }
}
auto StringValueMap()() { return new DStringValueMap; }

///
unittest {  
  auto stringMap = StringValueMap();
  stringMap["key1"] = StringValue("value1");

  assert(stringMap["key1"].toString == "value1");
  assert(cast(DStringValue)stringMap["key1"]);
  assert(!cast(DBooleanValue)stringMap["key1"]);

  stringMap["key2"] = "value2";
  assert(stringMap["key2"].toString == "value2");

  stringMap["key3"] = true;
  assert(stringMap["key3"].toString == "true");

  stringMap["key4"] = 100;
  assert(stringMap["key4"].toString == "100");

  stringMap["key5"] = 100.1;
  assert(stringMap["key5"].toString == "100.1");

  stringMap["key6"] = [StringValue("v1"), StringValue("v2")];

  assert(stringMap.toJson.toString == `{"key1":"value1","key6":null,"key2":"value2","key3":true,"key5":100.1,"key4":100}`); 
}