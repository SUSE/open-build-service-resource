# Open Build Service Resource

A Concourse CI resource to interface with open build service.
It can check the build service for newer releases, check out the package, build the package locally and commit it.

## Source Configuration

* `api`: defaults to https://api.opensuse.org

* `project`: required

* `package`: required

* `username`: optional

* `password`: optional

## Example

```
resource_types:
- name: open-build-service-resource
  type: docker-image
  source:
      repository: machinerytool/concourse-open-build-service-resource
      tag: latest

resources:
- name: osc-resource
  type: open-build-service-resource
  source:
    api: https://api.opensuse.org
    project: home:user
    package : package_name
    username: username
    password: password

jobs:
- name: modify-package
  plan:
  - get: osc-resource
  - task: build
    config:
      run:
        path: touch
        args: [some_work_on_package]
        directory: osc-resource
  - put: osc-resource
    params: { from: "osc-resource", commit: { message: "new release" } }
```

## Behaviour

### `check`: Check for new revisions

Checks the remote build service for versions.

### `in`: Fetch from build service

Checks out sources from the build service.

### `out`: Build and/or Commit to build service

First `osc addremove` is called to update the package file list according to
the local resource directory.

If a `build` hash is present in the params, `osc build` will be called for the specified `repository` and `version`.
The build is non-interactive so osc trusts all projects which are part of the specified build project.

The resource will commit changes to the build service if a commit message is present in `message`.

#### Parameters

     * `from`: Path to the folder containing the osc checkout
     * `build.repository`: Repository to build for
     * `build.arch`: Arch to build for
     * `commit.message`: Commit message for new revision

#### Example

```
    - put: osc-resource
      params:
        from: osc-resource
        build:
          repository: openSUSE_Leap_42.1
          arch: x86_64
        commit:
          message: new release
```
