# clas12-config

The standard run-group configuration files for GEMC, COATJAVA, chef workflow configurations, etc.

Standard gcard/yaml combinations for the different data sets and data-processing passes are listed in [setup.json](./setup.json).

## Notes

* _GEMC versions prior to 5.4 do not fully support binary magnetic field maps and CCDB for RF configuration._
* _COATJAVA versions prior to 10.0.7 do not support AI- denoising or track-finding._


## Run Configurations

The **clas12-default** gcard/yaml files provide the configuration with the detectors are at the nominal positions. 

- Run group A Spring 2018. gcard / yaml: **rga-spring2018**

  - Central detector shifted 19.4 mm upstream
  - target (LH2) at (0, 0, -19.4) mm  
  - HTCC shifted 10 mm upstream
  - FT On configuration
  - FMT present
  - LTCC sectors: 2 (N2), 3 (N2), 5 (old C4F10), 6
  - Torus polarity: -1, 1, -0.75, 0.75
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10594.0 and 6423.13 MeV
  - RF period: 4.008 ns

- Run group A Fall 2018. gcard / yaml: **rga-fall2018**

  - Central detector shifted 30 mm upstream
  - target (LH2) at (0.0, 0.0, -30) mm
  - HTCC shifted 20 mm upstream
  - FT On configuration
  - FMT not present
  - LTCC sectors: 3 (50% C4F10), 5 (N2)
  - Torus polarity: -1, 1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10604.1, 10600.0, and 7546.26 MeV
  - RF period: 4.008 ns

- Run group K low energy Fall 2018. gcard / yaml: **rgk-fall2018**

  - Central detector shifted 30 mm upstream
  - target (LH2) at (0.0, 0.0, -30) mm
  - HTCC shfted 20 mm upstream
  - FT Off configuration
  - FMT not present
  - LTCC sectors: 3 (50% C4F10), 5 (N2)
  - Torus polarity: 1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 6535.36 MeV
  - RF period: 4.008 ns

- Run group B Spring 2019. gcard / yaml: **rgb-spring2019**

  - Central detector shifted 30 mm upstream
  - target (LD2) at (0.0, 0.0, -30) mm
  - HTCC shfted 20 mm upstream
  - FT On configuration
  - FMT not present
  - LTCC sectors: 3 (C4F10), 5 (C4F10)
  - Torus polarity: -1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10199.8 MeV
  - RF period: 4.008 ns

- Run group A Spring 2019. gcard / yaml: **rga-spring2019**

  - Central detector shifted 30 mm upstream
  - bonus (LH2) at (0, 0, 0) mm
  - HTCC shfted 20 mm upstream
  - FT On configuration
  - FMT is present
  - LTCC sectors: 3 (C4F10), 5 (C4F10)
  - Torus polarity: -1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10199.8 MeV
  - RF period: 4.008 ns

- Run group B Fall 2019. gcard / yaml: **rgb-fall2018**

  - Central detector shifted 30 mm upstream
  - target (LD2) at (0.0, 0.0, -30) mm
  - HTCC shfted 20 mm upstream
  - FT On configuration
  - FMT not present
  - LTCC sectors: 3 (C4F10), 5 (C4F10)
  - Torus polarity: -1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10598.6, 10409.6, and 10199.8 MeV
  - RF period: 4.008 ns

![Alt engineering survey](surveyCyril.png?raw=true "engineering survey")
