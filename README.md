# docker-gunicorn
Simple container for running [gunicorn][].


## Usage
The default configuration assumes you have a WSGI application available inside
`/app` that is executed with `server:app`.  You are expected to mount a data
volume to that directory.

```bash
docker run --publish-all -v /path/to/wsgi-app:/app tswicegood/gunicorn
```

Note, this exposes port 8000.

## Configuration
Configuration is loaded via gunicorn's `--config` parameter and is located in
`/etc/gunicorn/config.py`.  You can override settings by mounting a data volume
to `/etc/gunicorn` with a custom `config.py` file.

The default configuration looks like this:

```python
bind = "0.0.0.0:8000"
chdir = "/app"
loglevel = "INFO"
workers = "4"
worker_class = "gevent"
reload = True

errorlog = "-"
accesslog = "-"
```

[gunicorn]: http://gunicorn.org/
