# Support.Dashboards
Dashboards for the Product Support team

These are built on Ruby and Smashing (https://smashing.github.io/).

* Available at https://support-dashboard.red-gate.com
* [Teamcity build](https://buildserver.red-gate.com/buildConfiguration/Dna_ProductSupport_Dashboard)
* [Octopus Deploy project](https://octopus.red-gate.com/app#/projects/support-dashboard/overview)

## Settings
Settings required to run are stored in a separate config.yml file. You will need to create this file locally in the root directory.

### Example config.yml:

```yaml
---
username: "zendesk username"
token: "zendesk api token"
```

## How to build and run

### Using docker

```shell
docker build -t support-dashboard
docker run --rm -p 3030:3030 -e "zendesk_username=zendesk username" -e "zendesk_token=zendesk api token" support-dashboard
```
