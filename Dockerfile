# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir numpy==1.21.0 scikit-learn==0.24.2 \
    && pip install --no-cache-dir -r requirements.txt

# Copy all files from the current directory to the working directory in the Docker image
COPY . .

# Expose the port that the application runs on
EXPOSE 5000

# Command to run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]
