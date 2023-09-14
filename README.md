# clas12-config

The standard run-group configuration files for GEMC, COATJAVA, chef workflow configurations, etc.

## Standard Combinations

| Run Group | Run Period     | Pass | Coatjava | GEMC(s) |
|-----------|------------|------|----------|---------|
| RG-A      | Fall '18   | 2    | 10.0.2   | 5.4     |
| RG-A      | Spring '19 | 2    | 10.0.2   | 5.4  |
| RG-B      | Spring '19 | 2    | 10.0.2   | 5.4  |
| RG-B      | Fall '19   | 2    | 10.0.2   | 5.4  |
| RG-K      | Fall '18   | 2    | 10.0.2   | 5.4  |
| RG-M      | Fall '21   | 1    | 10.0.2   | 5.4  |

| Run Group | Run Period     | Pass | Coatjava | GEMC(s) |
|-----------|------------|------|------------------|-----------------|
| RG-A      | Fall '18   | 1    | 6.5.6.1          | 4.4.2           |
| RG-A      | Spring '19 | 1    | 6.5.6.1          | 4.4.2           |
| RG-B      | Spring '19 | 1    | 6.5.9            | 4.4.2           |
| RG-B      | Fall '19   | 1    | 6.5.9            | 4.4.2           |
| RG-K      | Fall '18   | 1    | 6.5.6.1          | 4.4.2           |

| Run Group | Run Period | Pass | Coatjava | GEMC(s) |
|-----------|--------|------|------------------|-----------------|
| RG-C      |        |      | 10.0.2           | 5.4             |
| RG-D      | Spring '24  |      |                  |                 |
| RG-E      |        |      |                  |                 |
| RG-F      |        |      |                  |                 |
| RG-L      |        |      |                  |                 |

## Notes

* _GEMC versions prior to 5.3 do not fully support binary magnetic field maps, only ASCII._
* _GEMC versions prior to 5.4 do not support CCDB for RF configuration._
* _COATJAVA versions prior to 9.0.1 do not support AI- denoising or track-finding._
