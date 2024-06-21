# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port that the application runs on (not strictly necessary in Docker)
EXPOSE 5000

# Command to run the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]
