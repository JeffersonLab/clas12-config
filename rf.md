Using CCDB for RF configuration parameters in GEMC is supported as of version 5.4.   This is necessary for later moving to using real run numbers for simulations and geometry, rather than CCDB variations, and meanwhile minimizes the need for more CCDB variations.  This requires a [CCDB change]() of the RF frequency in `/calibration/eb/rf/config` to 250 MHz for the default variation.

_However, simulations run later than MM/DD/YYYY-HH:MM:SS can now require a change to any previously existing GEMC and/or COATJAVA configuration files, regardless the software versions used._

The preferred approach:
* ***Just start with configuration files from this repository!***

Other options include:
* Setting the appropriate RF configuration in your current GEMC configuration.
* Using a CCDB timestamp (or older SQLite file) in GEMC and/or COATJAVA

