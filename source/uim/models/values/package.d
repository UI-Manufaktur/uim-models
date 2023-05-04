/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.values;

import uim.models;
@safe:

public { 
	importuim.models.values.value;
public { 
	importuim.models.values.map;

// Packages
public { 
	importuim.models.values.arrays;
public { 
	importuim.models.values.datetimes;
public { 
	importuim.models.values.elements;
public { 
	importuim.models.values.lookups;
public { 
	importuim.models.values.maps;
public { 
	importuim.models.values.scalars;
public { 
	importuim.models.values.uuids;

// Modules
public { 
	importuim.models.values.entity;
public { 
	importuim.models.values.null_;
public { 
	importuim.models.values.object_;

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
