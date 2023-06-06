module uim.models.interfaces.model;

import uim.models;
@safe:

interface IModel {
  string registerPath();

  DModel create();
  DModel copy(); 
}