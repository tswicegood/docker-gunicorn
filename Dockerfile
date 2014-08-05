FROM continuumio/miniconda
MAINTAINER Travis Swicegood
EXPOSE 8000

RUN /opt/anaconda/bin/conda install -c tswicegood --yes "python<3" gevent gunicorn
ADD runner /usr/local/bin/runner
RUN chmod +x /usr/local/bin/runner

CMD ["server:app"]
ENTRYPOINT ["/usr/local/bin/runner", "--workers", "4", "--worker-class", "gevent", "--reload"]
