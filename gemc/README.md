

## Run Configurations

The **clas12-default** gcard/yaml files provide the configuration with the detectors are at the nominal positions. Even though one is provided, there is no need for a corresponding YAML file.

- Run group A Spring 2018. gcard / yaml: **rga-spring2018**

  - Central detector shifted 19.4mm upstream
  - target (LH2) at (0, 0, -19.4) mm  
  - HTCC shfted 10mm upstream
  - FT On configuration
  - FMT present
  - LTCC sectors: 2 (N2), 3 (N2), 5 (old C4F10), 6
  - Torus polarity: -1, 1, -0.75, 0.75
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10594.0 and 6423.13 MeV

- Run group A, K Fall 2018. gcard / yaml: **rga-fall2018**

  - Central detector shifted 30 mm upstream
  - target (LH2) at (1.2, 1.1, -30) mm
  - HTCC shfted 20 mm upstream
  - FT On configuration
  - FMT not present
  - LTCC sectors: 3 (50% C4F10), 5 (N2)
  - Torus polarity: -1, 1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10604.1, 10600.0, and 7546.26 MeV

- Run group K low energy Fall 2018. gcard / yaml: **rgk-fall2018**

  - Central detector shifted 30 mm upstream
  - target (LH2) at (1.2, 1.1, -30) mm
  - HTCC shfted 20 mm upstream
  - FT Off configuration
  - FMT not present
  - LTCC sectors: 3 (50% C4F10), 5 (N2)
  - Torus polarity: 1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 6535.36 MeV


- Run group B Winter 2019. gcard / yaml: **rgb-fall2018**

  - Central detector shifted 30 mm upstream
  - target (LD2) at (1.2, 1.1, -30) mm
  - HTCC shfted 20 mm upstream
  - FT On configuration
  - FMT not present
  - LTCC sectors: 3 (C4F10), 5 (C4F10)
  - Torus polarity: -1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10598.6, 10409.6, and 10199.8 MeV

- Run group A Spring 2019. gcard / yaml: **rga-spring2019**

  - Central detector shifted 30 mm upstream
  - target (LH2) at (1.2, 1.1, -30) mm
  - HTCC shfted 20 mm upstream
  - FT On configuration
  - FMT not present
  - LTCC sectors: 3 (C4F10), 5 (C4F10)
  - Torus polarity: -1,
  - Solenoid polarity: -1
  - Beam Current: from 5 to 75 nA
  - Beam energies: 10199.8 MeV

The RG A and B shifts come from the engineering group survey shown below.

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


![Alt engineering survey](surveyCyril.png?raw=true "engineering survey")

Overlap is detected for volume segment_hyp_s2_2:1
apparently fully encapsulating volume cyl_mirrors_s2left_2:1          at the same level !


## RF Signal:

For JLab, the RF is 1497 / 3 (halls, or 2 if 4 halls) - that is 499 MHz