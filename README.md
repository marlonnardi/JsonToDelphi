# Delphi-JsonToDelphiClass

## This is a fork of Petar Georgiev with improvements of Jens Borrisholt

## JsonToDelphi Online

https://jsontodelphi.com

## Fixes & Features: 7th December 2025 ##

### Features ###
* Added full support for **2D arrays of simple JSON types** (`TArray<TArray<string>>`).
* New internal logic to detect array dimensions during JSON parsing.
* Arrays up to **2 levels deep** are now supported when containing only simple types (string, number, boolean).
* Automatic generation of `TList<TArray<string>>` wrapper properties compatible with `Pkg.Json.DTO`.

### Fixes ###
* **Issue #9 resolved** – nested arrays no longer produce:  
  `"TPkgJsonMapper.GenerateUnit: Nested arrays are not supported!"`
* Fixed memory leaks related to:
  * `TPkgJsonMapper`
  * `TStubClass`
  * `TStubFieldList`
  * `TStubFieldObjectList`
  * `TStubArrayField`
* Corrected destructor logic for stub lifecycle cleanup.
* Improved parser behavior to avoid invalid propagation of `jtArray`.
* Added validation to block unsupported cases:
  * Arrays of arrays containing **objects**
  * Arrays with **more than two dimensions**

### Example ###

#### JSON Input ####
```json
{
  "values":[
    ["a", "b"],
    ["c", "d"]
  ]
}
```

### Before ###
❌ Nested arrays generated an exception:  
`Nested arrays are not supported!`

### After ###
✅ Full support for arrays like:  
```json
[ ["a","b"], ["c","d"] ]
```

## Fixes & Features: 16th June 2024 ##
### Features ###
* JSON null property are now mapped to a string.

Eg this JSON
```json
[
    {
        "createdAt": null,
        "updatedAt": "2013-05-28T15:47:57.962Z",
        "username": "jacquelyn88"
    }
]
```

Generates the following DTO:
```pascal
  TItems = class
  private
    FCreatedAt: string;
    [SuppressZero]
    FUpdatedAt: TDateTime;
    FUsername: string;
  published
    property CreatedAt: string read FCreatedAt write FCreatedAt;
    property UpdatedAt: TDateTime read FUpdatedAt write FUpdatedAt;
    property Username: string read FUsername write FUsername;
  end;
```

## Fixes & Features: 19th January 2024 ##

### Features ###
* Upgrade to Delphi 12
* Added Clone function on TJsonDTO class

### Bugs: ###
* Unittest TestDateTime didnt pass under Delphi 12
* Added missing Reserved words

## Fixes & Features: 06th February 2022 ##

### Features ###
* More interceptors where published in a new repo: https://github.com/JensBorrisholt/Json-Interceptors
* Added the possibility to download Pkg.Json.DTO.pas from https://jsontodelphi.com/

## Fixes & Features: 26h December 2021

### Features

- Added new class generation options

### Bugs:

- Fixed rename unit on generation screen
- Fixed screen alignment

## Fixes & Features: 03h October 2021

### Bugs:

- Wrong type detection. '2019-08-29' wasn't recognized as a Date, but a string
- All unittests didn't pass
- In the generator main form, the correct JSON wans't allways read from the MEMO
- In the generator main form, the JSON wasn't allways updated

### Features

- Upgraded to Delphi 11
- New property attribute : `[SuppressZero]`
  Delphi doesn't support Nullable types, so use this attribute to strip TDateTime property where value is 0.

A Small example:

```delphi
type
  TDateTimeDTO = class(TJsonDTO)
  private
    [SuppressZero]
    FSuppressDate: TDateTime;
    FNoSuppressDate: TDateTime;
  public
    property DateSuppress: TDateTime read FSuppressDate write FSuppressDate;
    property NoDateSuppress: TDateTime read FNoSuppressDate write FNoSuppressDate;
  end;
```

The above class will generate the following JSON, if both properties is 0

```json
{
  "suppressDate": "",
  "noSuppressDate": "1899-12-30T00:00:00.000Z"
}
```

NOTE: You can turn off this feature in the settings form

## Fixes & Features: 04th June 2021

### Bugs:

- An error message occured when switching between the diffrent demo files
- Dates without timestamp wasn't recognized within the RegEx
- Compile error in unit tests
- Updated elements in a list wasn't applied to the generated json.
- Issue #2 [Out of memory error and High CPU usage](https://github.com/JensBorrisholt/Delphi-JsonToDelphiClass/pull/2) - Thank You [MarkRSill](https://github.com/MarkRSill)

### Features

- Added unit tests for updating elements in lists.

## Fixes & Features: 26th Marts 2021

### Bugs:

- The same class name could appear multiple times:

E.g this JSON generated faulty code:

```json
{
  "/": {
    "readonly": true
  },
  "\\": {
    "readonly": true
  }
}
```

## Fixes & Features: 22th December 2020

### Bugs:

### Features

- New main form. Completly rewritten.
- Support for BSON
- Support for Minify JSON
- Support for multiblt output formats
- JSON are now minifyed before posted to the validator. Means support for larger JSONs to be validated.
- Version 3.0 released.

## Fixes & Features: 11th December 2020

### Bugs:

- "id": "01010101" faulty generated a TDateTime property not string.
- Settings.AddJsonPropertyAttributes didn't generate a Property Attribute

### Features

- JSON are now posted directly to the validator
- Better property name generator
- More unit tests

## Fixes & Features: 24th November 2020

### Bugs:

### Features

- Possibility to change the postfix of ClassNames, via Settings Dialog. Default: DTO
- Settings Dialog rewritten to use LiveBindings
- Create a Demo Project, using _your_ Json Data

## Fixes & Features: 22th November 2020

### Bugs:

- Demo generator didn't allways generate valid code
- Stopped the generator from generating surplus classes.

### Features

- Non object arrays are now mapped into a TList<T> instead of TArray<T>
- Added a settings dialog and settings class
- Properties in PascalCase (Setting)
- Allways use JsonName property annotation (Setting)
- Support for objects with diffrents properties in an Array

Eg this JSON

```json
{
  "ArrayTest": [
    {
      "S1": "5102"
    },
    {
      "S2": "True"
    }
  ]
}
```

Generates the following DTO:

```delphi
  TArrayTestDTO = class
  private
    FS1: string;
    FS2: string;
  published
    property S1: string read FS1 write FS1;
    property S2: string read FS2 write FS2;
  end;
```

## Previous changes

- Only floating point numbers are mapped to Double
- Numbers are mapped to Integer or Int64 depending on their size
- Generated code restructored, and simplified
- Generated classes inheriteds from TJsonDTO
- Socurce Code restructored
- Parser logic seperated from GUI logic
- Fixed bug in the RegEx for recognizing an ISO8601 Date
- Serialization removed the "noise" of List<T> i.e. includes internal properties that did not exist in the original JSON string.
- Generated code uses TObjectList<T>

Generates Delphi Classes based on JSON string. Just like XML Data Binding, but for JSON.

## Main features

- Build entirely on the RTL (no external dependencies) so it's cross-platform;
- Accepts any valid JSON string, no matter how complex the object is;
- Visualizes the structure of the JSON objects in a treeview;
- Generates complete delphi unit (declaration and implementation), based on the JSON string input;
- Automatically prefixes reserved Delphi words with "&" (ampersand);
- Support for JSON string that contains empty Array;
- Adds support code to automatically destroy complex sub types. So you don't have to manage subobject's lifetime manually;
- Uses TObjectList<T> to represent lists;
- Adds helper serialization/deserialization functions;
- Serialization and deserialization results in the same JSON structure!
- Automatically detects date/datetime parts and maps them to TDate/TDateTime (as long as dates are ISO8601 compliant);
- Maps floating point numbers to Double
- Maps Number to Integer or Int64 depending on the number
- Maps true/false values to Boolean;
- Supports JSON pretty print to format the input string;
- Simple and responsive GUI;
- Automatic check for update, based on ITask (Parallel Programming Library)!
- It's open source! You can find the source code and binary releases on GitHub.

* If the JSON array is empty the contained type is unknown. Unit generation works only with known and supported types.

\*\*\* The releases of JsonToDelphiClass (source and binaries) are public and reside on GitHub. The update unit uses GitHub's REST API to enumerate tags/releases.

Report any problems/suggestions using GitHub's facilities.
