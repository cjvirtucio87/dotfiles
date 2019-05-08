# 1/10/19

### investigating white gaps

- the underlying reprojected rasters look fine
- it seems like the rasters with white gaps are being placed on top of rasters that _should_ overlap the former
- so, it appears to be an issue with the mosaicking process

### strange looking curved view

- the map looks curved like a ball in the `new_run.mxd`
- the shapes are fine, and so are the reprojected rasters
- seems like a configuration issue with the `mxd` file

# 2/6/19

### Storage requirements

##### Run size

_Raw_
* EnrouteLo: 131 MB
* EnrouteHi: 227 MB
* Heli: 246 MB
* Sectionals: 3.18 GB
* Terminal: 650 MB

_Clipped_
* EnrouteLo: 204 MB 
* EnrouteHi: 508 MB 
* Heli: 287 MB
* Sectionals: 4.07 GB
* Terminal: 732 MB

_Reprojected_
* EnrouteLo: 3.80GB
* ENrouteHi:
* Heli: 816MB
* Sectionals: 19.4GB
* Terminal: 2.44GB

_Mosaic_

# 2/13/19

### Request for an API
The VFR and IFR datasets appear to have been generated from ArcGIS. We want to deploy them to an internal ArcGIS server. We currently download and process them, but hope that we'd be able to access the raw GDB data itself.


# 2/18/19

### ArCGIS prod error

Expected (per viz-beta.asias.aero): REST request successfully processed. Response size is 15117 characters.
Actual (per viz.asias.aero): Unable to process request. bytes
