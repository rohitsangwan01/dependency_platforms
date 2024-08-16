# Dependency Platforms

A tool to list platform support for all dependencies in your projects

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

To list dependencies which must include specific platfmrs

```bash
dart run dependency_platforms -i web,ios
```

To list dependencies which does not have specific platforms

```bash
dart run dependency_platforms -e web
```

### Sample

```bash
Found 14 packages
Loading : ███████████████████████████████████████████████████████████████████████████████████████ 14/14 100.0% [ 0:00:00.01 / 0:00:00.00 ]

cupertino_icons                      android  ios  linux  macos  web  windows
file_saver                           android  ios  linux  macos  web  windows
local_auth                           android  ios  -      macos  -    windows
lottie                               android  ios  linux  macos  -    windows
firebase_core                        android  ios  -      macos  web  windows
firebase_messaging                   android  ios  -      macos  web  -      
firebase_analytics                   android  ios  -      macos  web  -      
firebase_crashlytics                 android  ios  -      macos  -    -      
firebase_performance                 android  ios  -      -      web  -      
path_provider                        android  ios  linux  macos  -    windows
pdf                                  android  ios  linux  macos  web  windows
permission_handler                   android  ios  -      -      web  windows
screenshot                           android  ios  linux  macos  web  windows
shared_preferences                   android  ios  linux  macos  web  windows
```


