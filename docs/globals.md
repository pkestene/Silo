## Error Handling and Other Global Library Behavior

The functions described in this section of the Silo Application Programming Interface (API) manual, are those that effect behavior of the library, globally, for any file(s) that are or will be open.
These include such things as error handling, requiring Silo to do extra work to warn of and avoid overwrites, to compute and warn of checksum errors and to compress data before writing it to disk.

<details>
<summary><b>Click for table of methods in this section</b></summary>
  
### Methods and symbols in this section

&nbsp;|&nbsp;|&nbsp;
:---|:---|:---
[`DBErrString`](#dberrstring)|[`DBErrfunc`](#dberrfunc)|[`DBErrfuncname`](#dberrfuncname)
[`DBErrlvl`](#dberrlvl)|[`DBErrno`](#dberrno)|[`DBForceSingle`](#dbforcesingle)
[`DBGetAllowEmptyObjects`](#dbgetallowemptyobjects)|[`DBGetAllowOverwrites`](#dbgetallowoverwrites)|[`DBGetCompression`](#dbgetcompression)
[`DBGetDataReadMask2`](#dbgetdatareadmask2)|[`DBGetDatatypeString`](#dbgetdatatypestring)|[`DBGetDeprecateWarnings`](#dbgetdeprecatewarnings)
[`DBGetEnableChecksums`](#dbgetenablechecksums)|[`DBGetFriendlyHDF5Names`](#dbgetfriendlyhdf5names)|[`DBSetAllowEmptyObjects`](#dbsetallowemptyobjects)
[`DBSetAllowOverwrites`](#dbsetallowoverwrites)|[`DBSetCompression`](#dbsetcompression)|[`DBSetDataReadMask2`](#dbsetdatareadmask2)
[`DBSetDeprecateWarnings`](#dbsetdeprecatewarnings)|[`DBSetEnableChecksums`](#dbsetenablechecksums)|[`DBSetFriendlyHDF5Names`](#dbsetfriendlyhdf5names)
[`DBShowErrors`](#dbshowerrors)|[`DBVariableNameValid`](#dbvariablenamevalid)|[`DBVersion`](#dbversion)
[`DBVersionDigits`](#dbversiondigits)|[`DBVersionGE`](#dbversionge)|[`DB_VERSION_GE`](#db_version_ge)
</details>

---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBErrfuncname()`

* **Summary:** Get name of error-generating function

* **C Signature:**

  ```
  char const *DBErrfuncname (void)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Returned value:**

  DBErrfuncname returns a char const * containing the name of the function that generated the last error.
  It cannot fail.



* **Description:**

  The `DBErrfuncname` function is used to find the name of the function that generated the last Silo error.
  It is implemented as a macro.
  The returned pointer points into Silo private space and must not be modified or freed.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBErrno()`

* **Summary:** Get internal error number.

* **C Signature:**

  ```
  int DBErrno (void)
  ```

* **Fortran Signature:**

  ```
  integer function dberrno()
  ```


* **Returned value:**

  DBErrno returns the internal error number of the last error.
  It cannot fail.



* **Description:**

  The `DBErrno` function is used to find the number of the last Silo error message.
  It is implemented as a macro.
  The error numbers are not guaranteed to remain the same between different release versions of Silo.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBErrString()`

* **Summary:** Get error message.

* **C Signature:**

  ```
  char const *DBErrString (void)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Returned value:**

  DBErrString returns a char const * containing the last error message.
  It cannot fail.



* **Description:**

  The `DBErrString` function is used to find the last Silo error message.
  It is implemented as a macro.
  The returned pointer points into Silo private space and must not be modified or freed.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBShowErrors()`

* **Summary:** Set the error reporting mode.

* **C Signature:**

  ```
  void DBShowErrors (int level, void (*func)(char*))
  ```

* **Fortran Signature:**

  ```
  integer function dbshowerrors(level)
  ```


* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `level` | Error reporting `level`. One of DB_ALL, DB_ABORT, DB_TOP, or `DB_NONE`.
  `func` | Function pointer to an error-handling function.


* **Returned value:**

  DBShowErrors returns nothing (void).
  It cannot fail.



* **Description:**

  The `DBShowErrors` function sets the `level` of error reporting done by Silo when it encounters an error.
  The following table describes the action taken upon error for different values of `level`.

  Ordinarily, error reporting from the HDF5 library is disabled.
  However, `DBShowErrors` also influences the behavior of error reporting from the HDF5 library.

  **&nbsp;**

  Error level value|Error action
  :---|:---
  DB_ALL|Show all errors, beginning with the (possibly internal) routine that first detected the error and continuing up the call stack to the application.
  DB_ALL_AND_DRVR|Same as `DB_ALL` execpt also show error messages generated by the underlying driver library (PDB or HDF5).
  DB_ABORT|Same as `DB_ALL` except abort is called after the error message is printed.
  DB_TOP|(Default) Only the top-level Silo functions issue error messages.
  DB_NONE|The library does not handle error messages. The application is responsible for checking the return values of the Silo functions and handling the error.


  


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBErrlvl()`

* **Summary:** Return current error level setting of the library

* **C Signature:**

  ```
  int DBErrlvl(void)
  ```

* **Fortran Signature:**

  ```
  int dberrlvl()
  ```


* **Returned value:**

  Returns current error level of the library.
  Cannot fail.



---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBErrfunc()`

* **Summary:** Get current error function set by DBShowErrors()

* **C Signature:**

  ```
  void (*func)(char*) DBErrfunc(void);
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Description:**

  Returns the function pointer of the current error function set in the most recent previous call to `DBShowErrors()`.
  Testing whether we can type into this page and save it.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBVariableNameValid()`

* **Summary:** check if character string represents a valid Silo variable name

* **C Signature:**

  ```
  int DBValidVariableName(char const *s)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `s` | The character string to check


* **Returned value:**

  non-zero if the given character string represents a valid Silo variable name; zero otherwise



* **Description:**

  This is a convenience function for Silo applications to check whether a given variable name they wish to use will be considered valid by Silo.

  The only valid characters that can appear in a Silo variable name are all alphanumerics (e.g. [a-zA-Z0-9]) and the underscore (e.g. '_').
  If a candidate variable name contains any characters other than these, that variable name is considered invalid.
  If that variable name is ever used in a call to create an object in a Silo file, the call will fail with error `E_INVALIDNAME`.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBVersion()`

* **Summary:** Get the version of the Silo library.

* **C Signature:**

  ```
  char const *DBVersion (void)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Returned value:**

  DBVersion returns the version as a character string.



* **Description:**

  The `DBVersion` function determines what version of the Silo library is being used and returns that version in string form.
  The returned string should **not** be free'd by the caller.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBVersionDigits()`

* **Summary:** Return the integer version digits of the library

* **C Signature:**

  ```
  int DBVersionDigits(int *Maj, int *Min, int *Pat, int *Pre);
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `Maj` | Pointer to returned major version digit
  `Min` | Pointer to returned minor version digit
  `Pat` | Pointer to returned patch version digit
  `Pre` | Pointer to returned pre-release version digit (if any)


* **Returned value:**

  Returns 0 on success, -1 on failure..



---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBVersionGE()`

* **Summary:** Greater than or equal comparison for version of the Silo library

* **C Signature:**

  ```
  int DBVersionGE(int Maj, int Min, int Pat)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `Maj` | Integer, major version number
  `Min` | Integer, minor version number
  `Pat` | Integer, patch version number


* **Returned value:**

  One (1) if the library's version number is greater than or equal to the version number specified by Maj, Min, Pat arguments, zero (0) otherwise.



* **Description:**

  This function is the run-time equivalent of the `DB_VERSION_GE` macro.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetAllowOverwrites()`

* **Summary:** Allow library to over-write existing objects in Silo files

* **C Signature:**

  ```
  int DBSetAllowOverwrites(int allow)
  ```

* **Fortran Signature:**

  ```
  integer function dbsetovrwrt(allow)
  ```


* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `allow` | Integer value controlling the Silo library's overwrite behavior. A non-zero value sets the Silo library to permit overwrites of existing objects. A zero value disables overwrites. By default, Silo does **not** permit overwrites.


* **Returned value:**

  Returns the previous setting of the value.



* **Description:**

  By default, Silo permits a caller to over-write existing objects in a Silo file.
  However, overwrites are supported in Silo only when the new object involves individual member data that is no bigger than the original member data.
  If this condition is violated, then behavior is undefined and will likely lead to corrupted data.

  If you suspect you have a case where unintended overwrites are occurring, it can be useful to turn off overwrites.
  Then, you can watch for any errors reported by the Silo library and determine if and where overwrites might be occurring.

  Note that there is currently a bug in the HDF5 driver where overwrites wind up orphaning existing data in the file rather than in fact overwriting that data.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetAllowOverwrites()`

* **Summary:** Get current setting for the allow overwrites flag

* **C Signature:**

  ```
  int DBGetAllowOverwrites(void)
  ```

* **Fortran Signature:**

  ```
  integer function dbgetovrwrt()
  ```


* **Returned value:**

  Returns the current setting for the allow overwrites flag



* **Description:**

  See [`DBSetAllowOverwrites`](#dbsetallowoverwrites) for a description of the meaning of this flag


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetAllowEmptyObjects()`

* **Summary:** Permit the creation of empty silo objects

* **C Signature:**

  ```
  int DBSetAllowEmptyObjects(int allow)
  ```

* **Fortran Signature:**

  ```
  integer function dbsetemptyok(allow)
  ```


* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `allow` | Integer value indicating whether or not empty objects should be allowed to be created in Silo files. A zero value prevents callers from creating empty objects in Silo files. A non-zero value permits it. By default, the Silo library does **not** permit callers to create empty objects.


* **Returned value:**

  The previous setting of this value is returned.



* **Description:**

  For a long time, the "EMPTY" keyword convention (see "DBPutMultimesh" on page 159) was sufficient for dealing with cases where callers needed to create multiple, related multi-block objects with missing blocks.
  In fact, in many cases this convention was sufficient for combining variables which by and large existed on different collections of blocks on a common multi-block mesh.

  More recently, the need has arisen for the Silo library to permit callers to instantiate within Silo files "empty" objects; that is Silo objects with no problem-sized data associated with them.
  For example, a point mesh with no points or a ucd variable with no variable arrays.
  This requirement has been driven by the need to scale to larger problems and the use of nameschemes (see "DBMakeNamescheme" on page 209) in combination with meshes and variables with missing blocks.

  Historically, such an operation has been considered an error by the Silo library and prevented.But, that has been largely an overly cautious restriction in Silo to avert anticipated and not necessarily any real problems.
  DBSetAllowEmptyObjects with a non-zero argument enables the Silo library to by-pass these checks.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetAllowEmptyObjects()`

* **Summary:** Get current setting for the allow empty objects flag

* **C Signature:**

  ```
  int DBGetAllowEmptyobjets(void)
  ```

* **Fortran Signature:**

  ```
  integer function dbgetemptyok()
  ```


* **Arguments:**

  `None`
* **Description:**

  Get the current library setting for the allow empty objects flag.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBForceSingle()`

* **Summary:** Convert all datatype'd data read in read methods to type float

* **C Signature:**

  ```
  int DBForceSingle(int force)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `force` | Flag to indicate if forcing should be set or not. Pass non-zero to `force` single precision. Pass zero to **not** `force` single precision.


* **Returned value:**

  Zero on success.
  -1 on failure



* **Description:**

  This setting is global to the whole library and effects subsequent read operations.

  If `force` is non-zero, then any datatype'd arrays are converted on read from whatever their native datatype is to float.
  A datatype'd array is an array that is part of some Silo object struct containing a datatype member which indicates the type of data in the array.
  For example, a `DBucdvar` struct has a datatype member to indicate the type of data in its var and mixvar arrays.
  Such arrays will be converted on read if `force` here is non-zero.
  However, a `DBmaterial` object struct is `ALWAYS` integer data.
  There is no datatype member for such an object and so its data will `NEVER` be converted to float on read regardless of the `force` single status set here.

  This function's original intention may have been to convert `ONLY` double precision arrays to single precision.
  However, the PDB driver was apparently never designed that way and the PDB driver's behavior sort of established the defacto meaning of `DBForceSingle`.
  Consequently, as of Silo version 4.8 the HDF5 driver obeys these same semantics as well.
  Though, in fact the HDF5 driver was written to support the original intention of `DBForceSingle` and it worked in this (buggy) fashion for many years before real problems with it were encountered.

  This method is typically used by downstream, post-processing tools to reduce memory requirements.
  By default, Silo `DOES` NOT have single precision forcing enabled.
  When it is enabled, only the methods that result in reading of floating point data from a Silo file are effected.
  Finally, note that write methods are **not** effected.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetDatatypeString()`

* **Summary:** Return a string name for a given Silo datatype

* **C Signature:**

  ```
  char *DBGetDatatypeString(int datatype)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `datatype` | One of the Silo datatypes (e.g. DB_INT, DB_FLOAT, DB_DOUBLE, etc.)


* **Returned value:**

  A pointer to a newly allocated string representing the data type name.
  The caller must free the returned string.



* **Description:**

  Obtain the string name of a given Silo `datatype`.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetDataReadMask2()`

* **Summary:** Set the data read mask

* **C Signature:**

  ```
  unsigned long long DBSetDataReadMask2 (unsigned long long mask)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `mask` | The `mask` to use to read data. This is a bit vector of values that define whether each data portion of the various Silo objects should be read.


* **Returned value:**

  DBSetDataReadMask2 returns the previous data read mask.



* **Description:**

  DBSetDataReadMask2 replaces the now obsolete `DBSetDataReadMask`.

  The `DBSetDataReadMask2` allows the user to set the `mask` that's used to read various large data components within Silo objects.

  Most Silo objects have a metadata portion and a data portion.
  The data portion is that part of the object that consists of pointers to long arrays of data.
  These arrays are typically "problem sized" but in any event require additional I/O to read.
  By default, the read `mask` is set to `DBAll`.

  Setting the data read `mask` allows for a DBGet* call to return only part of the associated object's data.
  With the data read `mask` set to DBAll, the DBGet* functions return all of the information.
  With the data read `mask` set to DBNone, they return only the metadata.
  The `mask` is a bit vector specifying which part of the data model should be read.

  A special case is found in the `DBCalc` flag.
  Sometimes data is not stored in the file, but is instead calculated from other information.
  The `DBCalc` flag controls this behavior.
  If it is turned off, the data is not calculated.
  If it is turned on, the data is calculated.

  The values that `DBSetDataReadMask` takes as the `mask` parameter are binary-or'ed combinations of the values shown in the following table:

  **&nbsp;**

  Mask bit|Meaning
  :---|:---
  DBAll|All data values are read. This value is identical to specifying all of the other `mask` bits or'ed together, setting all of the bit values to 1.
  DBNone|No data values are read. This value sets all of the bit values to 0.
  DBCalc|If data is calculable, calculate it. Otherwise, return `NULL` for that part.
  DBMatMatnos|Material numbers (matnos) read by `DBGetMaterial`.
  DBMatMatnames|Material names (matnames) read by `DBGetMaterial`.
  DBMatMatlist|Zone-by-zone material list read by `DBGetMaterial`.
  DBMatMixList|Mixed material information read by `DBGetMaterial`.
  DBCurveArrays|Data values of curves read by `DBGetCurve`.
  DBPMCoords|Coordinate arrays read by `DBGetPointmesh`.
  DBPVData|Var data arrays read by `DBGetPointvar`.
  DBQMCoords|Coordinate arrays read by `DBGetQuadmesh`.
  DBQVData|Var data arrays read by `DBGetQuadvar`.
  DBUMCoords|Coordinate arrays read by `DBGetUcdmesh`.
  DBUMFacelist|Facelists of `UCD` meshes read by `DBGetUcdmesh`.
  DBUMZonelist|Zonelists of `UCD` meshes read by `DBGetUcdmesh`.
  DBUVData|Var data arrays read by `DBGetUcdvar`.
  DBFacelistInfo|Nodelists and shape info read by `DBGetFacelist`.
  DBZonelistInfo|Nodelist and shape info read by `DBGetZonelist`.
  DBUMGlobNodeNo|Global node numbers read by DBGetUcdmesh
  DBZonelistGlobZoneNo|Global zone numbers read by DBGetUcdmesh
  DBMatMatcolors|Material colors read by `DBGetMaterial` and DBGetMultimat
  DBMMADJNodelists|Adjacency nodelists read by DBGetMultimeshadj
  DBMMADJZonelists|Adjacency zonelists read by DBGetMultimeshadj
  DBCSGMBoundaryInfo|Boundary list read by DBGetCsgmesh
  DBCSGMZonelist|Zonelist read by DBGetCsgmesh
  DBCSGMBoundaryNames|Boundary names read by DBGetCsgmesh
  DBCSGVData|Var data arrays read by DBGetCsgvar
  DBCSGZonelistZoneNames|Zone names read by DBGetCSGZonelist
  DBCSGZonelistRegNames|Region names read by DBGetCSGZonelist
  DBPMGlobNodeNo|Global node numbers read by DBGetPointmesh
  DBPMGhostNodeLabels|Ghost node labels read by DBGetPointmesh
  DBQMGhostNodeLabels|Ghost node labels read by DBGetQuadmesh
  DBQMGhostZoneLabels|Ghost zone lables read by DBGetQuadmesh
  DBUMGhostNodeLabels|Ghost node lables read by DBGetUcdmesh
  DBZonelistGhostZoneLabels|Ghost zone lables read by `DBGetUcdmesh` and/or DBGetZonelist


  

  Use the `DBGetDataReadMask2` call to retrieve the current data read `mask` without setting one.

  By default, the data read `mask` is set to `DBAll`.
  The data read `mask` effects only the read portion of the Silo `API`.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetDataReadMask2()`

* **Summary:** Get the current data read mask

* **C Signature:**

  ```
  unsigned long long DBGetDataReadMask2 (void)
  ```

* **Fortran Signature:**

  ```
  None
  ```

* **Returned value:**

  DBGetDataReadMask2 returns the current data read mask.



* **Description:**

  Note that `DBGetDataReadMask2` replaces the now obsolete `DBGetDataReadMask`.

  The `DBGetDataReadMask2` allows the user to find out what mask is currently being used to read the data within Silo objects.

  See [`DBSetDataReadMask2`](#dbsetdatareadmask2) for a complete description.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetEnableChecksums()`

* **Summary:** Set flag controlling checksum checks

* **C Signature:**

  ```
  int DBSetEnableChecksums(int enable)
  ```

* **Fortran Signature:**

  ```
  integer function dbsetcksums(enable)
  ```


* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `enable` | Integer value controlling checksum behavior of the Silo library. See description for a complete explanation.


* **Returned value:**

  Returns the previous setting for checksum behavior.



* **Description:**

  If checksums are enabled, whenever Silo writes data, it will compute checksums on the data in memory and store these checksums with the data in the file.
  Note that during a write call, in no circumstance will Silo re-read data written to confirm it was written correctly (e.g. it gets back what it wrote).
  In other words, Silo will not detect checksum errors on writes.
  It will detect checksum errors only on reads, only if checksums were actually computed and stored with the data when it was written and only when checksums are indeed enabled.

  If checksums are enabled, whenever Silo reads data `AND` the data it is reading has checksums stored in the file, it will compute and compare checksums.
  If the checksums computed on read do not agree with the checksums stored in the file, the Silo call resulting in the data read will fail.
  The error, E_CHECKSUM, will be set (See [`DBShowErrors`](#dbshowerrors)).
  Note that because checksums are not checked on write, there is no foolproof way to detect whether a read has failed because the data was corrupted when it was originally written or because the read itself has failed.

  Checksum checks are supported `ONLY` on the HDF5 driver.
  The PDB driver `DOES` NOT support checksum checks.
  Calling `DBCreate()` with checksumming enabled will fail if `DB_PDB` is specified as the driver.
  If checksumming is enabled while any PDB file is opened, the request for checksumming will be silently ignored by all attempts to write or read data from a PDB file.

  In the HDF5 driver, only the data that winds up in HDF5 datasets in the file is checksumed.
  In most applications, this represents more than 99% of all the data the client writes.
  However, it is important to note that when checksuming is enabled, **not** ALL data written by Silo is checksumed.
  Various bits of metadata is not checksumed.

  Finally, empirical results show that the resulting files are 1-5% larger and take about 1-5% longer to write when checksumming is enabled.
  This is due primarily to the fact that a different class of HDF5 dataset, called a chunked dataset, is required in order to `enable` checksumming.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetEnableChecksums()`

* **Summary:** Get current state of flag controlling checksumming

* **C Signature:**

  ```
  int DBGetEnableChecksums(void)
  ```

* **Fortran Signature:**

  ```
  integer function dbgetcksums()
  ```


* **Returned value:**

  Zero if checksumming is not currently enabled.
  Non-zero if checksumming is currently enabled.



* **Description:**

  This function returns the current setting for the library-global flag controlling checksumming behavior.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetCompression()`

* **Summary:** Set compression options for succeeding writes of Silo data

  Synopsis:n

  int DBSetCompression(char const *options)

  Fortran Equivalent:

  integer function dbsetcompress(options, loptions)

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `options` | Character string containing the name of the compression method and various parameters. The method set using the keyword, "METHOD=". Any remaining parameters are dependent on the compression method and are described below.


* **Returned value:**

  Returns the previous value set for compression behavior.



* **Description:**

  Compression is currently supported only on the HDF5 driver.

  Note that the responsibility for enabling compression falls only on the data producer.
  Any Silo clients attempting to read compressed data may do so without concern for whether the data in the file is compressed or not.
  If the data is compressed, decompression will occur automatically during read.
  This is true as long as the Silo library to which the client reading the data was compiled and linked has the necessary decompression code.
  Because writer and reader need not be compiled and linked to the same exact Silo library installation, each could be compiled with differing compression capabilities making it impossible to read data in some situations.

  To the extent possible, the public installations of Silo on `LLNL` systems have all been enabled with compatible compression features.
  However, because many application developers have taken to creating their own installations of Silo, it is important to consider the effect of disabling (or enabling) various compression features.

  Compression features are controlled by an arbitrary string, whose contents are described in more detail below.
  By default, the Silo library does not have compression enabled.
  A number of different compression techniques are available.
  Some operate without regard to the type of data and mesh being written.
  Others depend on the type of data and sometimes even the type of mesh.

  Compression parameters global to all compression methods: There are two global parameters that control behavior of compression algorithms.
  These must appear in the compression `options` string before any compression-specific parameters.

  The first is the error mode ("ERRMODE=<word>" which controls how the Silo library responds when it encounters an error during compression and/or is unable to compress the data.
  The two `options` are "FALLBACK" or "FAIL". Including "ERRMODE=FALLBACK" in the compression `options` string tells Silo that whenever compression fails, it should simply fallback to writing uncompressed data.
  Including "ERRMODE=FAIL" in the compression `options` string tells Silo to fail the write and return `E_COMPRESSION` error for the operation.

  The second is the minimum compression ratio to be achieved by compressing the data.
  It is specified as "MINRATIO=<float>". For example, including "MINRATIO=2.5" in the compression `options` string tells Silo that all data must be compressed by at least a factor of 2.5:1.
  If it is unable the compress by at least this amount, Silo will either fallback or fail the write depending on the `ERRMODE` setting.

  The remaining paragraphs describe compression algorithm specific `options`.

  GZIP compression: is enabled using "METHOD=GZIP" in the `options` string.
  GZIP recognizes the LEVEL=<int>, compression parameter.
  The compression level is an integer from 0 to 9, where 0 results in the fastest compression performance but at the expense of lower compression ratios.
  Likewise, a level of 9 results in the slowest compression performance but with possibly better compression ratios.
  If the "LEVEL=<int>" keyword does not appear in the `options` string or specifies invalid values, the default is level one (1).
  The `GZIP` method of compression is applied independently to float and integer data for all types of meshes and variables.
  It is also guaranteed to be available to all Silo clients.

  SZIP compression: is enabled using "METHOD=SZIP" in the `options` string.
  The `SZIP` compression algorithm is designed specifically for scientific data.
  SZIP recognizes the BLOCK=<int>, and MASK={EC|NN} parameters.
  The BLOCK=<int>, takes an integer value from 0 to 32, which is a blocking size and must be even and not greater than 32, with typical values being 8, 10, 16, or 32.
  This parameter affects the compression ratio; the more values vary, the smaller this number should be to achieve better performance.
  The MASK=EC, selects entropy coding method, this is best suited for data that has been processed, working best for small numbers.MASK=NN, selects the nearest neighbor coding method, preprocesses the data then applies the EC method as above.
  The default parameters for `SZIP` compression are "METHOD=SZIP BLOCK=4 MASK=NN". If in a subsequent write operation (DBPutXXX, DBWrite, etc.) the value for `BLOCK` is bigger than the total number of elements in a dataset, the write will fail.
  This means that you should take care not to have compression turned on when doing small writes.
  To achieve optimal performance for `SZIP` compression, it is recommended that one select a value for `BLOCK` that is an integral divisor of the dataset's fastest-changing dimension.
  Note that the `SZIP` compression encoder is licensed for non-commercial use only while the decoder (e.g. decompression) is unlimited.
  Read more about `SZIP` licensing at http://www.hdfgroup.org/doc_resource/SZIP/index.html.
  Note that `SZIP` decompression is **not** guaranteed to be available to all Silo clients; only those for which the Silo library was configured with `SZIP` compression capability enabled.
  Like GZIP, `SZIP` compression is applied to float and integer data independently of the types of meshes and variables.

  FPZIP compression: is enabled using "METHOD=FPZIP" in the `options` string.
  The `FPZIP` compression algorithm was developed by Peter Lindstrom at `LLNL` and is also designed for high speed compression of regular arrays of data.
  FPZIP recognizes the "LOSS=0|1|2|3" parameter which specifies the amount of loss that is tolerable in the result in terms of quarters of full precision.
  For example, "LOSS=3" indicates that a loss of 3/4 of full precision is tolerable (resulting in 8 bit floats or 16 bit doubles).
  Note that for data being written from a double precision writer for down stream visualization purposes, visualization tools such as VisIt often enforce single precision data.
  Therefore, specifying a loss of 32 bits here for double precision data could have a dramatic impact on compression and I/O performance with negligible effect in down stream visualization.
  If the `LOSS` parameter is not specified, the default is "LOSS=0". It is possible to build the Silo library without `FPZIP` compression support.
  So, it is not always guaranteed to exist.

  HZIP compression: is enabled using "METHOD=HZIP" in the `options` string.
  The `HZIP` compression algorithm was developed by Peter Lindstrom at `LLNL` and is designed for high-speed compression of unstructured meshes of quad or hex elements and node-centered variables (it does not yet support zone-centered variables) defined on a mesh.
  Before applying this compression method to any given Silo mesh or variable object, the Silo library checks for compatibility with the constraints of the compression algorithm.
  If the mesh or variable object is compatible, the object will be written with compression enabled.
  Otherwise, compression will be silently ignored.
  It is possible to build the Silo library without `HZIP` compression support.
  So, it is not always guaranteed to exist.

  Note that `FPZIP` and `HZIP` compression features are **not** available in a `BSD` Licensed release of Silo library.
  They are available only in a Legacy licensed release of the Silo library.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetCompression()`

* **Summary:** Get current compression parameters

* **C Signature:**

  ```
  char const *DBGetCompression()
  ```

* **Fortran Signature:**

  ```
  integer function dbgetcompress(options, loptions)
  ```


* **Arguments:**

  `None`
* **Returned value:**

  NULL if no compress parameters have been set.
  A string of compression parameters if compression has been set



* **Description:**

  Obtain the current compression parameters.
  Caller should **not** free the returned string.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetFriendlyHDF5Names()`

* **Summary:** Set flag to indicate Silo should create friendly names for HDF5 datasets

* **C Signature:**

  ```
  int DBSetFriendlyHDF5Names(int enable)
  ```

* **Fortran Signature:**

  ```
  integer function dbsethdfnms(enable)
  ```


* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `enable` | Flag to indicate if friendly names should be turned on (non-zero value) or off (zero).


* **Returned value:**

  Old setting for this flag



* **Description:**

  In versions of Silo prior to 4.8, the default behavior of the HDF5 driver was that it used HDF5 in a way that made the data somewhat UNnatural to the user when viewed with HDF5 tools such as h5ls, h5dump and hdfview as well as other tools that interact with the data via the HDF5 API.
  This was not a problem for Silo but was a problem for these and other HDF5 tools.

  DBSetFriendlyHDF5Names() was introduced as a way to address this issue so that the data in an HDF5 file written by Silo looked more "natural". Calling `DBSetFriendlyHDF5Names()` with a value of one ('1') will result in additional HDF5 metadata being added to the file (in the form of soft links) with better names (and locations) for Silo objects' datasets.
  Note that creation of links does increase the file size somewhat.
  This affect is less significant for larger files.
  It is also likely to have some negative but as yet to be investigated effect on I/O performance

  Calling `DBSetFriendlyHDF5Names()` with a value of two ('2') will foregoe the creation of soft links and instead write the actual dataset data where those links would have been created (e.g. the current working directory of the Silo file).
  This may be important for files consisting of a large number of objects as it eliminates the creation of the /.silo group and subsequent very large number of dataset objects in that one group.

  In versions of Silo 4.8 and newer, the default behavior of the Silo library is to use mode '2', that is to create the datasets themselves there the links would have otherwise been created.

  Notes:

  If it was not obvious from the name, this method effects only the HDF5 driver.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetFriendlyHDF5Names()`

* **Summary:** Get setting for friendly HDF5 names flag

* **C Signature:**

  ```
  int DBGetFriendlyHDF5Names()
  ```

* **Fortran Signature:**

  ```
  integer function dbgethdfnms()
  ```


* **Arguments:**

  `None`
* **Returned value:**

  The current setting for the HDF5 friendly names flag.



* **Description:**

  See [`DBSetFriendlyHDF5Names`](#dbsetfriendlyhdf5names)()`.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBSetDeprecateWarnings()`

* **Summary:** Set maximum number of deprecate warnings Silo will issue for any one function, option or convention

* **C Signature:**

  ```
  int DBSetDeprecateWarnings(int max_count)
  ```

* **Fortran Signature:**

  ```
  integer function dbsetdepwarn(max_count)
  ```


* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `max_count` | Maximum number of warnings Silo will issue for any single `API` function.


* **Returned value:**

  The old maximum number of deprecate warnings



* **Description:**

  Some of Silo's `API` functions have been deprecated.
  Some options on Silo objects have also been deprecated.
  Finally, some conventional arrays, such as _visit_defvars, have been deprecated.

  When an attempt to use a deprecated function, option or convention is detected, Silo will issue an error message on stderr and proceed normally.
  The default number of error messages any given deprecated function will report on stderr is 3.
  Note, this is on a per-deprecated function, option or convention basis.
  If this number is decreased to zero by calling DBSetDeprecateWarnings(0), no warnings will be generated on stderr.
  If it is increased, more warnings will be issued.

  Note that deprecated functions, options and conventions are guaranteed to operate correctly only in the first release in which they became deprecated.
  In subsequent releases, they may be removed entirely.
  So, it is wise to run your application for a while without turning off deprecation warnings to get some inventory of functions that require attention.


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DBGetDeprecateWarnings()`

* **Summary:** Get maximum number of deprecated function warnings Silo will issue

* **C Signature:**

  ```
  int DBGetDeprecateWarnings()
  ```

* **Fortran Signature:**

  ```
  integer function dbgetdepwarn()
  ```


* **Arguments:**

  `None`
* **Returned value:**

  The current maximum number of deprecate warnings



* **Description:**

  


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
### `DB_VERSION_GE()`

* **Summary:** Compile time macro to test silo version number

* **C Signature:**

  ```
  DB_VERSION_GE(Maj,Min,Pat)
  ```

* **Arguments:**

  Arg&nbsp;name | Description
  :---|:---
  `Maj` | Major version number digit
  `Min` | Minor version number digit. A zero is equivalent to no minor digit.
  `Pat` | Patch version number digit. A zero is equivalent to no patch digit.


* **Returned value:**

  True (non-zero) if the combination of major, minor and patch digits results in a version number of the Silo library that is greater (e.g. newer) than or equal to the version of the Silo library being compiled against.
  False (zero), otherwise.



* **Description:**

  This macro is useful for writing version-specific code that interacts with the Silo library.
  Note, however, that this macro appeared in version 4.6.1 of the Silo library and is not available in earlier versions of the library.

  As an example of use, the function `DBSetDeprecateWarnings()` was introduced in Silo version 4.6 and not available in earlier versions.
  You could use this macro like so...

  #if DB_VERSION_GE(4,6,0)

  DBSetDeprecateWarnings(0);

  #endif


---
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>