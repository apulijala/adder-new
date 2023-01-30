FROM python:3
COPY adder.py /
ENTRYPOINT [ "python3", "adder.py" ]
