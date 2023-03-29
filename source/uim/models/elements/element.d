/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.elements.element;

@safe:
import uim.models;

class DElement {
  static namespace = moduleName!DElement;

  // Constructors
  this() { initialize; }

  this(string myName) { 
    this().name(myName); }

  this(Json aJson) { 
    this();    
    if (aJson != Json(null)) this.fromJson(aJson); }

  void initialize(Json configSettings = Json(null)) {
    this  
      .requestPrefix("element_");
  }

  mixin(DStringValueMap, "values"));
  mixin ValueMapWrapper;

  mixin(OProperty!("string", "className"));
  mixin(OProperty!("bool", "isDynamic"));
  mixin(OProperty!("string", "requestPrefix"));

  // Every element can have a name like an identifier. 
  string _name;
  O name(this O)(string  newName) { _name = newName.strip.replace(" ", "_"); return cast(O)this; }
  string name() { return _name; }
  version(test_uim_models) {
    unittest {
      assert(Entity.name("name1").name == "name1");
      assert(Entity.name("name1").name("name2").name == "name2");
      assert(Entity.name("name name").name == "name_name");
    }
  }

  mixin(OProperty!("string[string]", "parameters"));

/*   // Display of entity 
  mixin(OProperty!("string", "display"));

  //	Description about the entity and more
  mixin(OProperty!("string", "description")); */
  
  mixin(OProperty!("string", "registerPath"));
  
  STRINGAA selector(STRINGAA parameters) {
    STRINGAA results;

    foreach(key, val; parameters) {
      if (key.indexOf(requestPrefix) == 0) {
        results[key.replace(requestPrefix, "")] = val;
      } else {
        results[key] = val;
      }
    }

    return results;
  }
  ///
  unittest {
    auto element = new DElement;
    assert(element.selector(["x":"y", "element_id": "1234"]) == ["id":"1234", "x":"y"]);
  }

  // Read data from STRINGAA
  void fromStringAA(STRINGAA reqParameters) {
    foreach(k, v; reqParameters) this[k] = v; 
  }

  // Read data from request
  void fromRequest(STRINGAA requestValues) {
    auto myData = selector(requestValues);
    foreach(key, value; myData) {
      this[key] = value;
    } 
  }

  // Returns data in string format (HTML compatible)
  string opIndex(string key) {
    switch(key) {
      case "name": return this.name;
      default:
        if (auto value = values[key]) { return value.toString; }
        return null;
    }      
  }

  // Set data 
  void opIndexAssign(string newValue, string key) {
    writeln("In void opIndexAssign(string newValue, string key)");
    if (auto myValue = valueOfKey(key)) {
      writeln("Found Value");
      myValue.set(newValue);
      return;
    }
    writeln("Not Found Value");

    if (isDynamic) { // can add new values
      auto myValue = StringAttribute.createValue;
      myValue.set(newValue);
      values[key] = myValue;
    }
  }
  ///
  unittest {
    auto element = new DElement;
    element.addValues(["test":StringAttribute]);
    element["test"] = "something";
    // assert(element["test"] == "something");
  } 

  DValue valueOfKey(string key) {
    writeln("DValue valueOfKey(string key)");
/*     if (auto keys = key.split(".")) {
      if (keys.length == 1) { return values[key]; }

      DValue myValue = cast(DElementValue)values[keys[0]];
      if (auto myElementValue = cast(DElementValue)myValue) {
        return myElementValue.value.valueOfKey(keys[1..$].join("."));
      }
      return myValue;
    }
 */    return values[key];
  }

  // Set UUID value
  void opIndexAssign(UUID value, string key) {
    if (auto myValue = cast(DUUIDValue)valueOfKey(key)) { 
      // values[key] exists and value of DUUIDValue
      myValue.value = value;
    }
  }

  // Set long value
  void opIndexAssign(long value, string key) {
    if (auto myValue = cast(DLongValue)valueOfKey(key)) { 
      // values[key] exists and value of DLongValue
      myValue.value = value;
    }     
  } 

  // Set bool value
  void opIndexAssign(bool value, string key) {
    if (auto myValue = cast(DBooleanValue)valueOfKey(key)) { 
      // values[key] exists and value of DBooleanValue
      myValue.value = value;
    }    
  }

  // Set field(key) if type Entity
  void opIndexAssign(DElement value, string key) {
    if (auto myValue = cast(DElementValue)valueOfKey(key)) { 
      // values[key] exists and value of DLongValue
      myValue.value = value;
    }   
  }

  DElement create() { return new DElement; }
  DElement create(Json data) { auto myElement = create; myElement.fromJson(data); return myElement; }

  DElement clone() { return create(toJson); }
  DElement clone(Json data) { auto myElement = create(toJson); myElement.fromJson(data); return myElement; }
  
  DElement copyTo(DElement targetOfCopy) {
    if (targetOfCopy) {
      targetOfCopy.fromJson(this.toJson);
    }
    return targetOfCopy; }
  DElement copyFrom(DElement targetOfCopy) {
    if (targetOfCopy) {
      fromJson(targetOfCopy.toJson);
    }
    return this;
  } 

  Bson toBson() { return Bson(toJson); }

  void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "name": this.name(v.get!string); break;
        default: 
          this.values[k].value(v);
          break;
      }            
    }
  }

  Json toJson(string[] showFields = null, string[] hideFields = null) {
    auto result = Json.emptyObject;
    
    result["name"] = this.name;

    foreach(k; values.keys) {
      result[k] = this.values[k].toJson;
    }
  
    return result;
  }
}
auto Element() { return new DElement; }
auto Element(string name) { return new DElement(name); }
auto Element(Json json) { return new DElement(json); }

version(test_uim_models) { unittest {
  assert(Element);
  assert(Element.name("test").name == "test");
  assert(Element.name("testName").name == "testname");

}}

