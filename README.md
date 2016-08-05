# Open Build Service Resource

A Concourse CI resource to harness the incredible power of osc.

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
        run: touch osc-resource/some_work_on_package
    - put: osc-resource
```

## Behaviour

### `check`: Check?

### `in`: Fetch from build service

### `out`: Commit to build service

TODO support `params: { build: git-resource }` to build locally
