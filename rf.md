Using CCDB for RF configuration parameters in GEMC is supported as of version X.Y.Z.   This is necessary for moving to using real run numbers for simulations and geometry, rather than CCDB variations, and meanwhile minimize the need for more CCDB variations.

_However, it involves a modification to CCDB on MM/DD/YYYY-HH:MM:SS that can necessitate a change to any previously existing GEMC and/or COATJAVA configuration files, regardless the software versions used._

That CCDB change is [here]() and just sets the RF frequency in `/runcontrol/rf` to 250 MHz in the default variation, and RG-M's CCDB variation now has their 500 MHz.

The preferred approach is to just start with configuration files from this repository, which is what jobs submitted from our OSG web portal will do.

Other options include:
* Adding the appropriate RF settings to your current GEMC configuration.
  * how?
* Using a CCDB timestamp in GEMC and/or COATJAVA, which can be achieved by
  * using an SQLite snapshot of CCDB that was created before MM/DD/YYYY-HH:MM:SS
  * specifying a CCDB timestamp in your GEMC/COATJAVA configuration
  * how?

