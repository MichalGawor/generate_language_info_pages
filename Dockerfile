FROM python:3.7-alpine

COPY . /generate_language_info_pages

WORKDIR /generate_language_info_pages

RUN python setup.py install --user

CMD ["ash", "-c", "cd /generate_language_info_pages && python -m 'generate_language_info_pages'"]
