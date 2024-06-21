```bash
docker run -itd -e PROXY_VNC=127.0.0.1:5900 -e LISTEN_ADDR=0.0.0.0:8080 -p 8080:8080 --name novnc kagamir/novnc:latest
```
