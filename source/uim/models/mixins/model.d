/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.models.mixins.model;

import uim.models;
@safe:

string modelThis(string name) {
  return `
    this() { super("`~name~`"); this.className("`~name~`"); }
    this(Json configSettings) { super("`~name~`", configSettings); }
    this(IModelManager aManager, Json configSettings = Json(null)) { this(configSettings).application(aManager); }

    this(string aName, Json configSettings = Json(null)) { this(configSettings).name(aName); }
    this(string[string] someParameters, Json configSettings = Json(null)) { this(configSettings).parameters(someParameters); }

    this(IModelManager aManager, string aName, Json configSettings = Json(null)) { this(aManager, configSettings).name(aName); }
    this(IModelManager aManager, string[string] someParameters, Json configSettings = Json(null)) { this(aManager, configSettings).parameters(someParameters); }

    this(string aName, string[string] someParameters, Json configSettings = Json(null)) { this(name, configSettings).parameters(someParameters); }
    this(IModelManager aManager, string aName, string[string] someParameters, Json configSettings = Json(null)) { this(aManager, name, configSettings).parameters(someParameters); }
  `;
}

template ModelThis(string name) {
  const char[] ModelThis = modelThis(name);
}

string modelCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(IModelManager aManager) { return new `~className~`(aManager); }
    auto `~shortName~`(string aName) { return new `~className~`(aName); }
    auto `~shortName~`(string[string] someParameters) { return new `~className~`(someParameters); }

    auto `~shortName~`(string aName, string[string] someParameters) { return new `~className~`(aName, someParameters); }

    auto `~shortName~`(IModelManager aManager, string aName) { return new `~className~`(aManager, aName); }
    auto `~shortName~`(IModelManager aManager, string[string] someParameters) { return new `~className~`(aManager, someParameters); }
  `;
}

template ModelCalls(string shortName, string className) {
  const char[] ModelCalls = modelCalls(shortName, className);
}
