# Info

## Network

```
Gateway / Subnet: 10.1.51.1/24

dns:
  static:
    - name: bootstrap.static.lab
      address: 10.1.51.109

    - name: bastion.static.lab
      address: 10.1.51.110

    - name: api.upi.static.lab
      address: 10.1.51.111

    - regexp: (.*).apps.upi.static.lab
      address: 10.1.51.112

    - name: host00.static.lab
      address: 10.1.51.120

    - name: host01.static.lab
      address: 10.1.51.121

    - name: host02.static.lab
      address: 10.1.51.122

    - name: host03.static.lab
      address: 10.1.51.123

    - name: host04.static.lab
      address: 10.1.51.124

    - name: host05.static.lab
      address: 10.1.51.125

    - name: host06.static.lab
      address: 10.1.51.126
```


## Links
- [https://console.redhat.com/openshift/install/platform-agnostic](OCP - Platform Agnostic Install)