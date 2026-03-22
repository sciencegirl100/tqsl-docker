# Trusted QSL Builder

All you need is docker!

## Local User Install

```bash
./install.sh
```

## Only Build AppImage

```bash
docker buildx build --output type=local,dest=. .
chmod +x tqsl.AppImage
```
