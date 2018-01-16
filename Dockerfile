FROM python:2.7-alpine
RUN apk add --update openssl
WORKDIR /src
COPY requirements.txt /src
RUN pip install pipenv
RUN pipenv install --system -r requirements.txt --skip-lock --deploy
COPY . /src
CMD pytest --driver SauceLabs \
  --capability browserName Chrome \
  --capability platform "Windows 10"
