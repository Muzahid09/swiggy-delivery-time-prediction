# Set the base image 
FROM python:3.13.1

# Setup the working directory
WORKDIR /app_

# Copy the required files
COPY  requirements-docker.txt ./


# Installing pacakages
RUN pip install -r requirements-docker.txt


# Copy other necessary files
COPY /app_beta.py ./
COPY ./scripts/data_clean_utils.py ./scripts/data_clean_utils.py
COPY ./models/preprocessor.joblib ./models/preprocessor.joblib
COPY ./run_information.json ./



# Exposing the port
EXPOSE 8000


# Run the file using command
CMD [ "python", "./app_beta.py" ]

