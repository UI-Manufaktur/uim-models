module uim.models.interfaces.model;

import uim.models;
@safe:

interface IModel {
  DModel create();
  DModel copy(); 
}