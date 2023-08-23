Using CCDB for RF configuration parameters in GEMC is supported as of version X.Y.Z.   This is also necessary for moving to using real run numbers in CCDB for simulations.  However, it involves a modification to CCDB that can require a change to any previously existing GEMC and/or COATJAVA configuration files, regardless their versions.

The preferred approach is to just start with configuration files from this repository.

Other options include:
* Adding the appropriate RF settings to your current GEMC configuration.
* Using a CCDB timestamp in GEMC and/or COATJAVA.
