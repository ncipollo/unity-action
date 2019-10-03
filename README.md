# Unity Action

This action may be used to generate a Unity build or run tests within a Unity project.

## Action Inputs
- **build_method**: The static method to execute during the build.
- **license**: Your unity license. Use secrets!
- **mode**: The mode to run the action in. Can be set to `build` or `test`.
- **password**: Your unity password. Required to generate license. Use secrets!
- **serial**: Your unity pro serial number. Required to generate pro license. Not required for unity personal. Use secrets!
- **username**: Your unity user name. Required to generate license. Use secrets!'

## License

To generate a license:
- Omit the `license` input 
- Include  your `username`, `password` and `serial` (optionally for pro licenses).
- Look for the xml dump in the output.
- Copy this xml dump into an `.alf` file.
- Follow the steps found here: [ManualActivationGuide](https://docs.unity3d.com/Manual/ManualActivationGuide.html).
- Copy the contents of the `.ulf` into a secret then use this with the `license` input.

## Tests

This action can be utilized for running your unity tests. Set `mode` to `test` (or omit this input). The action will then run the tests found within the project.

Example: 
```yml
name: Unity Test

on: [push]

jobs:

  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: 'run unity tests'
      uses: ncipollo/unity-action@master
      with: 
        username: ${{ secrets.username }}
        password: ${{ secrets.password }}
        license: ${{ secrets.license }}
```

## Builds

This action may also be utilized to run your build pipeline. Set `mode` to `build`. You must also specify a static class method to run using `build_method`. This would typically be a method on a build class. For example: [BuildCommand.cs](https://github.com/ncipollo/unity-ci-test/blob/master/Assets/Scripts/Editor/BuildCommand.cs)

Example:
```yml
name: Unity Build

on: [push]

jobs:

  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: 'run unity build'
      uses: ncipollo/unity-action@master
      with: 
        license: ${{ secrets.license }}
        mode: build
        build_method: BuildCommand.PerformBuild
    - name: 'upload artifact'
      uses: actions/upload-artifact@v1.0.0
      with:
        name: build.tar.gz
        path: Build/os_x
```