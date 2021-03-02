
FROM python:3.7-alpine
WORKDIR /miko

ADD . /miko

RUN pip install -r requirements.txt

# runs in port 9090
EXPOSE 9090

# To run application
CMD ["python","web.py"]
