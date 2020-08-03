fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios lint
```
fastlane ios lint
```
Linting
### ios code_coverage
```
fastlane ios code_coverage
```
Code Coverage
### ios screenshots
```
fastlane ios screenshots
```
Screen Shots
### ios gen_docs
```
fastlane ios gen_docs
```
Generate Documentation
### ios tests
```
fastlane ios tests
```
Run Test
### ios ui_tests
```
fastlane ios ui_tests
```
Run UI Test
### ios all_tests
```
fastlane ios all_tests
```
Run All Test
### ios clear_keychain
```
fastlane ios clear_keychain
```
Clear Keychain
### ios certs_for_env
```
fastlane ios certs_for_env
```
Get Certs for ENV [development | adhoc | enterprise | appstore]
### ios build_ci
```
fastlane ios build_ci
```
Building CI
### ios build_debug
```
fastlane ios build_debug
```
Building Adhoc Debug
### ios build_enterprise_debug
```
fastlane ios build_enterprise_debug
```
Building Enterprise Debug
### ios beta
```
fastlane ios beta
```
Push a new beta build to TestFlight

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
