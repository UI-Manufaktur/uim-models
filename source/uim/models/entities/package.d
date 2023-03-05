/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.entities;

public import uim.oop.entities.entity;
public import uim.oop.entities.entities;

template EntityThis(string name) {
  const char[] EntityThis = `
    this() { super(); this.className("`~name~`"); }
    this(UUID myId) { this().id(myId).name("`~name~`-"~this.id.toString); }
    this(string myName) { this().name(myName); }
    this(UUID myId, string myName) { this(myId).name(myName); }
    this(Json aJson) { this().fromJson(aJson); }

    override DEntity create() { return `~name~`; }
  `;
}

template EntityCalls(string name) {
  const char[] EntityCalls = `
    auto `~name~`() { return new D`~name~`; } 
    auto `~name~`(UUID myId) { return new D`~name~`(myId); } 
    auto `~name~`(string myName) { return new D`~name~`(myName); } 
    auto `~name~`(UUID myId, string myName) { return new D`~name~`(myId, myName); } 
    auto `~name~`(Json json) { return new D`~name~`(json); } 
  `;
}