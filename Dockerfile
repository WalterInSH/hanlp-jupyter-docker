FROM python:3.6.10-buster
MAINTAINER Walter Zhang <walterinsh@outlook.com>

# hanlp downloads tensorflow which will take too long
# thus execute this command separately then docker can use its cache
RUN pip3 --no-cache-dir install hanlp==2.0.0a42

# install jupyter
RUN pip3 --no-cache-dir install jupyter==1.0.0 \
        jupyter-http-over-ws==0.0.8 \
        ipykernel==5.1.1 \
        nbformat==4.4.0

RUN jupyter serverextension enable --py jupyter_http_over_ws

WORKDIR /jupyter

EXPOSE 8888

CMD ["bash", "-c", "jupyter notebook --notebook-dir=/jupyter --ip 0.0.0.0 --no-browser --allow-root"]
