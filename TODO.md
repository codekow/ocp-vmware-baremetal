# Manual vsbmc deployment

```
podman run \
  -d \
  --name vsbmc \
  -v $(pwd):/vsbmc \
  -p "6240:6240/udp" \
  -p "6241:6241/udp" \
  -p "6242:6242/udp" \
  -p "6243:6243/udp" \
  -p "6244:6244/udp" \
  -p "6245:6245/udp" \
  -p "6246:6246/udp" \
    ghcr.io/kurokobo/vbmc4vsphere:0.10.0

export vcenter_host=10.0.0.1
export vcenter_user=adminstrator@vcenter.local
export vcenter_pass="password"

for i in {0..6}
do
  podman exec -it vsbmc \
    vsbmc add host0${i} \
    --port 624{i} \
    --viserver ${IPMI_HOST} \
    --viserver-username ${vcenter_user} \
    --viserver-password ${vcenter_pass}
done

```
