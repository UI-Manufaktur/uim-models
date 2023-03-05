/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.oop.elements;

public import uim.oop.elements.interface_;
public import uim.oop.elements.element;

template ElementThis(string name) {
  const char[] ElementThis = `
		this() { super(); }
		this(string myName) { this().name(myName); }
		this(Json aJson) { this().fromJson(aJson); }
		override DElement create() { return `~name~`; }
  `;
}

template ElementCalls(string name) {
  const char[] ElementCalls = `
		auto `~name~`() { return new D`~name~`; } 
		auto `~name~`(string myName) { return new D`~name~`(myName); } 
		auto `~name~`(Json json) { return new D`~name~`(json); } 
  `;
} 