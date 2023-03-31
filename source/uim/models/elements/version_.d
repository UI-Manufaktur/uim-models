/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.elements.version_;

@safe:
import uim.models;

class DVersion: DElement {
  static namespace = moduleName!DVersion;

  // Constructors
  this() { super(); }

  this(string myName) { 
    super(myName); }

  this(Json aJson) { 
    this();    
    if (aJson != Json(null)) this.fromJson(aJson); }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "description": StringAttribute,
        "display": StringAttribute,
        "mode": StringAttribute
      ]);
  }

  mixin(ValueProperty!("string", "description"));
  /// 
  unittest {
    auto element = new DVersion;
    element.description = "newDescription";
    assert(element.description == "newDescription");
    assert(element.description != "noDescription");

    assert(element.description("otherDescription").description == "otherDescription");
    assert(element.description != "noDescription");
  }

  mixin(ValueProperty!("string", "display"));
  /// 
  unittest {
    auto element = new DVersion;
    element.display = "newDisplay";
    assert(element.display == "newDisplay");
    assert(element.display != "noDisplay");

    assert(element.display("otherDisplay").display == "otherDisplay");
    assert(element.display != "noDisplay");
  }

  mixin(ValueProperty!("string", "mode")); 
  /// 
  unittest {
    auto element = new DVersion;
    element.mode = "newMode";
    assert(element.mode == "newMode");
    assert(element.mode != "noMode");

    assert(element.mode("otherMode").mode == "otherMode");
    assert(element.mode != "noMode");
  }

  override DElement create() { return new DVersion; }
}
auto Version() { return new DVersion; }
auto Version(string name) { return new DVersion(name); }
auto Version(Json json) { return new DVersion(json); }

version(test_uim_models) { unittest {
  assert(Version);
  assert(Version.name("test").name == "test");
  assert(Version.name("testName").name == "testname");

}}

