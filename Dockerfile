FROM python:3.6.10-buster
MAINTAINER Walter Zhang <walterinsh@outlook.com>

# hanlp downloads tensorflow which will take too long
# thus execute this command separately then docker can use its cache
RUN pip3 --no-cache-dir install -i https://mirrors.aliyun.com/pypi/simple hanlp==2.0.0a42

# install jupyter lab 
RUN pip3 install -i https://mirrors.aliyun.com/pypi/simple jupyterlab

WORKDIR /jupyter

EXPOSE 8888

CMD ["bash", "-c", "jupyter lab --notebook-dir=/jupyter --ip 0.0.0.0 --no-browser --allow-root"]
