Using CCDB for RF configuration parameters in GEMC is supported as of version X.Y.Z.   This is also necessary for moving to using real run numbers in CCDB for simulations.  However, it involves a modification to CCDB on MM/DD/YYYY-HH:MM:SS that can require a change to any previously existing GEMC and/or COATJAVA configuration files, regardless their versions.

The preferred approach is to just start with configuration files from this repository, which is what jobs submitted from our OSG web portal will do.

Other options include:
* Adding the appropriate RF settings to your current GEMC configuration.
* Using a CCDB timestamp in GEMC and/or COATJAVA, which can be achieved by
  * using an SQLite snapshot of CCDB that was created before MM/DD/YYYY-HH:MM:SS
  * specifying a CCDB timestamp in your GEMC/COATJAVA configuration

