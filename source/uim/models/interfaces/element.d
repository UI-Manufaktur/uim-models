/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.models.interfaces.element;

@safe:
import uim.models;

interface IElement {
	// Read data from STRINGAA
  void fromStringAA(STRINGAA reqParameters);

  // Read data from request
  void fromRequest(STRINGAA requestValues);
}