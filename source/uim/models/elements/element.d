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

  void initialize(Json configSettings = Json(null)) {}

  mixin(OProperty!("DMapValue!string", "values"));
  mixin ValueMapWrapper;

  mixin(OProperty!("string", "className"));

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

    auto foundId = parameters.get("entity_id", parameters.get("id", ""));
    if (foundId.length > 0) results["id"] = foundId;               
    auto foundName = parameters.get("entity_name", parameters.get("name", ""));
    if (foundName.length > 0) results["name"] = foundName;               

    return results;
  }

  // Read entity from STRINGAA
  void fromStringAA(STRINGAA reqParameters) {
    foreach(k, v; reqParameters) this[k] = v; 
  }

  void fromRequest(STRINGAA requestValues) {
    debug writeln("fromRequest...", requestValues);
    /* foreach(fName; fieldNames) {
      auto requestKey = "entity_"~fName;
      if (auto boolValue = cast(DBooleanValue)values[fName]) {
        boolValue.value(requestKey in requestValues ? true : false);
      }
      else {
        if (requestKey in requestValues) {
          this[fName] = requestValues[requestKey];
        }
      }
    } */
  }

  // Converts entity property to string, which is HTML compatible
  string opIndex(string key) {
    switch(key) {
      case "name": return this.name;
      default:
        if (auto value = values[key]) { return value.toString; }
        return null;
    }      
  }

  void opIndexAssign(string value, string key) {
    switch(key) {
      case "name": this.name(value); break;
      default:
        values[key] = value;
        break;
    }      
  }

  // Read value and set entity value
  void opIndexAssign(UUID value, string key) {
    switch(key) {
      default:
        values[key] = value;
        break;
    }      
  }

  void opIndexAssign(long value, string key) {
    switch(key) {
      default:
        values[key] = value;
        break;
    }      
  } 

  void opIndexAssign(bool value, string key) {
    switch(key) {
      default:
        values[key] = value;
        break;
    }      
  }

  // Set field(key) if type Entity
  void opIndexAssign(DElement value, string key) {
    switch(key) {
      default:
        break;
    }      
  }

/*   DElement create() { return new DElement; }
  DElement create(Json data) { return create.fromJson(data); }

  DElement clone() { return create.fromJson(toJson); }
  DElement clone(Json data) { return create.fromJson(toJson).fromJson(data); }
  
  DElement copyTo(DElement targetOfCopy) {
    return targetOfCopy ? targetOfCopy.fromJson(this.toJson) : targetOfCopy; }
  DElement copyFrom(DElement targetOfCopy) {
    return targetOfCopy ? fromJson(targetOfCopy.toJson) : this;
  } */

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

