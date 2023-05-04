/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.values;

import uim.models;
@safe:

public { 
	import uim.models.values.value;
public { 
	import uim.models.values.map;

// Packages
public { 
	import uim.models.values.arrays;
public { 
	import uim.models.values.datetimes;
public { 
	import uim.models.values.elements;
public { 
	import uim.models.values.lookups;
public { 
	import uim.models.values.maps;
public { 
	import uim.models.values.scalars;
public { 
	import uim.models.values.uuids;

// Modules
public { 
	import uim.models.values.entity;
public { 
	import uim.models.values.null_;
public { 
	import uim.models.values.object_;

template ValueThis(string name, string datatype = null) { // Name for future releases
  const char[] ValueThis = `  
    this() { super(); }
    this(DAttribute theAttribute) { this().attribute(theAttribute); }
    this(string theValue) { this().value(theValue); }
    this(Json theValue) { this().value(theValue); }
    this(DAttribute theAttribute, string theValue) { this(theAttribute).value(theValue); }
    this(DAttribute theAttribute, Json theValue) { this(theAttribute).value(theValue); }`~
    (datatype ? 
    ` this(`~datatype~` theValue) { this().value(theValue); }
      this(DAttribute theAttribute, `~datatype~` theValue) { this(theAttribute).value(theValue); }`
      : "");
}

template ValueCalls(string name, string datatype = null) {
  const char[] ValueCalls = `  
    auto `~name~`() { return new D`~name~`; }
    auto `~name~`(DAttribute theAttribute) { return new D`~name~`(theAttribute); }
    auto `~name~`(string theValue) { return new D`~name~`(theValue); }
    auto `~name~`(Json theValue) { return new D`~name~`(theValue); }
    auto `~name~`(DAttribute theAttribute, string theValue) { return new D`~name~`(theAttribute, theValue); }
    auto `~name~`(DAttribute theAttribute, Json theValue) { return new D`~name~`(theAttribute, theValue); }
  `~
  (datatype ? 
  ` auto `~name~`(`~datatype~` theValue) { return new D`~name~`(theValue); }
    auto `~name~`(DAttribute theAttribute, `~datatype~` theValue) { return new D`~name~`(theAttribute, theValue); }`
    : "");
}

/* template ValueProperty(string name) {
  const char[] EntityCalls = `
    auto `~name~`() { return this.values[`~name~`]; } 
    O `~name~`(this O)(string newValue) { this.values[`~name~`].value(newValue); return cast(O)this; } 
    O `~name~`(this O)(Json newValue) { this.values[`~name~`].value(newValue); return cast(O)this;  } 
  `;
} */
