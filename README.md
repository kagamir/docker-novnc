## Docker NoVNC

```bash
docker run -itd -e PROXY_VNC=192.168.12.34:5900 -e LISTEN_ADDR=0.0.0.0:8080 -p 8080:8080 --name novnc kagamir/novnc:latest
```
