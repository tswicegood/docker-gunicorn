FROM continuumio/miniconda
MAINTAINER Travis Swicegood
EXPOSE 8000

RUN /opt/anaconda/bin/conda install -c tswicegood --yes "python<3" gevent gunicorn
ADD runner /usr/local/bin/runner
RUN chmod +x /usr/local/bin/runner
ADD config.py /etc/gunicorn/config.py

CMD ["server:app"]
ENTRYPOINT ["/usr/local/bin/runner"]
