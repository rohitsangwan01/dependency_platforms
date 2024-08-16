# Dependency Platforms

A tool to list platform support for all dependencies in your projects

[![dependency_platforms version](https://img.shields.io/pub/v/dependency_platforms?label=dependency_platforms)](https://pub.dev/packages/dependency_platforms)

## Installation

Activate globally

```bash
dart pub global activate dependency_platforms
```

OR add to dependencies

```bash
dart pub add dev:dependency_platforms
```

## Usage

If Activated globally

```bash
dart pub global run dependency_platforms
```

If added to dependency

```bash
dart run dependency_platforms
```

### Commands

To Get Help

```bash
dart run dependency_platforms -h
```

To list dependencies which must include specific platforms

```bash
dart run dependency_platforms -i web,ios
```

To list dependencies which does not have specific platforms

```bash
dart run dependency_platforms -e web
```

### Sample

```bash
Found 15 packages
Loading : █████████████████████████████████████████████████████████████████████████ 15/15  

Dependency                          | Android | IOS | Linux | MacOS | Web | Windows
-----------------------------------------------------------------------------------
image_picker                        | android | ios | linux | macos | web | windows
flutter_shimmer                     | android | ios | linux | macos | web | windows
fluttercontactpicker                | android | ios | -     | -     | web | -      
form_field_validator                | android | ios | linux | macos | web | windows
flutter_image_compress              | android | ios | -     | macos | web | -      
fl_chart                            | android | ios | linux | macos | web | windows
file_saver                          | android | ios | linux | macos | web | windows
local_auth                          | android | ios | -     | macos | -   | windows
lottie                              | android | ios | linux | macos | -   | windows
firebase_core                       | android | ios | -     | macos | web | windows
firebase_messaging                  | android | ios | -     | macos | web | -      
firebase_analytics                  | android | ios | -     | macos | web | -      
firebase_crashlytics                | android | ios | -     | macos | -   | -      
firebase_performance                | android | ios | -     | -     | web | -      
path_provider                       | android | ios | linux | macos | -   | windows
```
